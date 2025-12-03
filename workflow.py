import matplotlib
matplotlib.use('Agg') 
import matplotlib.pyplot as plt 
import yfinance as yf
import pandas as pd
from fredapi import Fred
import hashlib
import os

def ensure_dir(filepath):
    os.makedirs(os.path.dirname(filepath), exist_ok=True)

def download_stock_data(tickers, start_date, interval, output_file):
    
    #yfinance
    df_yf = yf.download(
        tickers,
        start=start_date,
        interval=interval,
        auto_adjust=False,
        progress=False
    )

    df_yf = df_yf.reset_index()
    df_yf.columns = [
        'Date' if col[0] == 'Date' else
        f"{col[0]}_{col[1]}" if isinstance(col, tuple) else
        col
        for col in df_yf.columns
    ]
    df_yf = df_yf.rename(columns={'Adj Close': 'Adj_Close'})
    
    ensure_dir(output_file)
    df_yf.to_csv(output_file, index=False)


def download_sp500_data(api_key, series_id, start_date, frequency, output_file):
    
    
    from pandas_datareader import fred 

    fred_api = Fred(api_key=api_key)
    
    sp500_series = fred_api.get_series(
        series_id,
        observation_start=start_date,
        frequency=frequency
    )

   

    sp500 = pd.DataFrame(sp500_series)
    sp500 = sp500.rename(columns={sp500.columns[0]: 'S&P_500_Index'})
    sp500 = sp500.reset_index().rename(columns={'index': 'Date'})
    
    ensure_dir(output_file)
    sp500.to_csv(output_file, index=False)
    print(f"-> S&P 500 data saved to {output_file}")


def clean_and_merge_data(stock_input_file, sp500_input_file, output_file):
    
    
    df_yf_raw = pd.read_csv(stock_input_file, parse_dates=['Date'])
    sp500 = pd.read_csv(sp500_input_file, parse_dates=['Date'])

    
    adj_close_cols = [col for col in df_yf_raw.columns if col.startswith('Adj Close_')]
    
    df_yf_cleaned = df_yf_raw[['Date'] + adj_close_cols].copy()
    
    column_mapping = {col: col.split('_')[-1] for col in adj_close_cols}
    df_yf_cleaned.rename(columns=column_mapping, inplace=True)

   
    merged_df = pd.merge(df_yf_cleaned, sp500, on='Date', how='inner')
    
    ensure_dir(output_file)
    merged_df.to_csv(output_file, index=False)
    print(f"-> Merged data saved to {output_file}")


def generate_checksum(input_file, output_file):
    
    
    hash_initiate = hashlib.sha256()
    
    with open(input_file, "rb") as f:
        while chunk := f.read(4096):
            hash_initiate.update(chunk)
            
    sha = hash_initiate.hexdigest()
    
    ensure_dir(output_file)
    with open(output_file, 'w') as f:
        f.write(sha)
        


def generate_plot(input_file, output_file):
    
    
    df = pd.read_csv(input_file, parse_dates=['Date'])
    df['Date'] = pd.to_datetime(df['Date'])
    df = df.set_index('Date')

    df_numeric = df.select_dtypes(include=['number'])
    
    
    df_normalized = (df_numeric / df_numeric.iloc[0]) * 100


    plt.figure(figsize=(14, 7))
    
    for column in df_normalized.columns:
        if df_normalized[column].notna().any() and (df_normalized[column] != float('inf')).all():
            plt.plot(df_normalized.index, df_normalized[column], label=column)

    plt.title('Normalized Performance of Selected Stocks vs. S&P 500 (Base: 100 on Start Date)')
    plt.xlabel('Date')
    plt.ylabel('Normalized Value (Index = 100)')
    plt.grid(True, linestyle='--', alpha=0.6)
    plt.legend(loc='upper left', bbox_to_anchor=(1, 1), ncol=1)
    plt.tight_layout()
    
    ensure_dir(output_file)
    plt.savefig(output_file)
    plt.close() 
