
# Snakefile

from workflow import (
    download_stock_data,
    download_sp500_data,
    clean_and_merge_data,
    generate_checksum,
    generate_plot,
    run_regression_test
)

config = {
    # api key to use: 3dd37ba3122e1228a5bacd7f8c6f3775
    "fred_api_key": ' ',

    # parameters
    "tickers": ['NVDA','JPM','WMT','TSLA','AMZN','AVGO','CAT','XOM','JNJ','ABT','PLD'],
    "start_date": '2016-01-01',
    "interval": '1mo',
    "sp500_series_id": 'SP500',
    "frequency": 'm',

    # Output File Paths 
    "raw_stock_data": "data/raw/Stocks_2016_2025.csv",
    "raw_sp500_data": "data/raw/sp500_2016_2025.csv",
    "merged_data": "data/processed/merged_df.csv",
    "checksum_output": "data/checksums/merged_df.sha",
    "plot_output": "data/processed/performance_chart.png",
    "dag_output": "data/processed/dag.png",
    "regression_test_output": "data/checksums/regression_test_result.txt",
    "trusted_checksum": "a4f29a06d27842ffeb5ee2bb9a2652fe7dac682b6e2a2b26c6ef1f756f50480e"
}

# final outputs
FINAL_OUTPUTS = [
    config["plot_output"],
    config["checksum_output"],
    config["dag_output"],
    config["regression_test_output"]
]

# Rule all
rule all:
    input:
        FINAL_OUTPUTS

# Rule 1: download stock
rule download_stock_data:
    output:
        config["raw_stock_data"]
    params:
        tickers=config["tickers"],
        start_date=config["start_date"],
        interval=config["interval"]
    run:
        download_stock_data(
            tickers=params.tickers,
            start_date=params.start_date,
            interval=params.interval,
            output_file=output[0]
        )

# Rule 2: download S&P
rule download_sp500_data:
    output:
        config["raw_sp500_data"]
    params:
        api_key=config["fred_api_key"],
        series_id=config["sp500_series_id"],
        start_date=config["start_date"],
        frequency=config["frequency"]
    run:
        download_sp500_data(
            api_key=params.api_key,
            series_id=params.series_id,
            start_date=params.start_date,
            frequency=params.frequency,
            output_file=output[0]
        )

# Rule 3: Clean and merge
rule clean_and_merge_data:
    input:
        stock=config["raw_stock_data"],
        sp500=config["raw_sp500_data"]
    output:
        config["merged_data"]
    run:
        clean_and_merge_data(
            stock_input_file=input.stock,
            sp500_input_file=input.sp500,
            output_file=output[0]
        )

# Rule 4: Checksums
rule generate_checksum:
    input:
        config["merged_data"]
    output:
        config["checksum_output"]
    run:
        generate_checksum(
            input_file=input[0],
            output_file=output[0]
        )

# Rule 5: Regression Test 
rule run_regression_test: 
    input:
        checksum=config["checksum_output"]
    output:
        config["regression_test_output"]
    params:
        trusted_checksum=config["trusted_checksum"]
    run:
        run_regression_test(
            calculated_checksum_file=input.checksum,
            trusted_checksum=params.trusted_checksum,
            output_file=output[0]
        )


# Rule 6: Plot
rule plot_data:
    input:
        config["merged_data"]
    output:
        config["plot_output"]
    run:
        generate_plot(
            input_file=input[0],
            output_file=output[0]
        )

# Rule 6: Workflow Visualization
rule generate_dag: 
    input:
        config["plot_output"],
        config["checksum_output"]
    output:
        config["dag_output"]
    shell:
        """
        snakemake --dag | dot -Tpng > {output}
        """