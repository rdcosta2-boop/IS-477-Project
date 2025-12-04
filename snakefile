
# Snakefile

from workflow import (
    download_stock_data,
    download_sp500_data,
    clean_and_merge_data,
    generate_checksum,
    generate_plot
)

config = {
    "fred_api_key": '3dd37ba3122e1228a5bacd7f8c6f3775',

    # parameters
    "tickers": ['NVDA','JPM','WMT','TSLA','AMZN','AVGO','CAT','XOM','JNJ','ABT','PLD'],
    "start_date": '2016-01-01',
    "interval": '1mo',
    "sp500_series_id": 'SP500',
    "frequency": 'm',

    # Output File Paths 
    "raw_stock_data": "data/raw/Stocks_2015_2025.csv",
    "raw_sp500_data": "data/raw/sp500_2015_2025.csv",
    "merged_data": "data/processed/merged_df.csv",
    "checksum_output": "data/checksums/merged_df.sha",
    "plot_output": "data/processed/performance_chart.png"
}

# final outputs
FINAL_OUTPUTS = [
    config["plot_output"],
    config["checksum_output"]
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

# Rule 5: Plot
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