
# Snakefile

configfile: "config.yaml"

import workflow as wf


rule all:
    input:
        config["checksum_output"],
        config["plot_output"] 


rule setup_dirs:
    output:
        directory("data/raw"),
        directory("data/processed")
    shell:
        "mkdir -p {output}"



# Rule 1 Download Stock
rule download_stocks:
    output:
        config["raw_stock_data"]
    params:
        tickers=config["tickers"],
        start_date=config["start_date"],
        interval=config["interval"]
    run:
        wf.download_stock_data(
            params.tickers, 
            params.start_date, 
            params.interval, 
            str(output)
        )


# Rule 2 S&P
rule download_sp500:
    output:
        config["raw_sp500_data"]
    params:
        api_key=config["fred_api_key"],
        series_id=config["sp500_series_id"],
        start_date=config["start_date"],
        frequency=config["frequency"]
    run:
        wf.download_sp500_data(
            params.api_key, 
            params.series_id, 
            params.start_date, 
            params.frequency, 
            str(output)
        )


# Rule 3 Merge Clean
rule merge_data:
    input:
        stock_file=config["raw_stock_data"],
        sp500_file=config["raw_sp500_data"]
    output:
        config["merged_data"]
    run:
        wf.clean_and_merge_data(
            str(input.stock_file), 
            str(input.sp500_file), 
            str(output)
        )


# Rule 4: Checksum
rule checksum:
    input:
        data_file=config["merged_data"]
    output:
        config["checksum_output"]
    run:
        wf.generate_checksum(
            str(input.data_file), 
            str(output)
        )


# Rule 5 Plot
rule plot_data:
    input:
        data_file=config["merged_data"]
    output:
        config["plot_output"]
    run:
        wf.generate_plot(
            str(input.data_file), 
            str(output)
        )