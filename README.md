## **Title: Comparing 10 year US stock returns to the S&P 500**

Contributors: 
* Emma Bills (ebills2@illinois.edu)
* Rhea Dcosta (rdcosta2@illinois.edu)

  
#### Summary
Our project involves comparing stock market returns from 11 popular US stocks to the return on the S&P 500, a common equity benchmark, over the last 10 years. We chose 11 stocks diversified across sectors (Financial Services, Healthcare, consumer discretionary, Telecoms, industrials, Technology, Bonds, consumer staples, energy and real estate). As a Finance + Data Science major, this project topic is particulary relevant for me. For Emma, her motivation is a keen interest in the workings of the stock market. 
The research questions we have attempted to answer through this project are:
<ul>
<li>Which stocks and sectors have outperformed the S&P 500 in the last 10 years?</li>
<li>Can we make predictions for the S&P 500 using the 11 stocks in our portfolio?</li>
</ul>

We are interested in these specific research questions because we want to see if a group of certain stocks can outperform a broader market index, and the relationship between the two.  These datasets will help address the question by allowing us to analyze the trends in a specific timeframe (~a decade), and this will help us to explore the relationship between certain stocks and the S&P500.  We can then use this information to answer other questions, and this can lead to a deeper understanding of the data and the trends that are found.  
We found that most stocks have tracked the S&P500 benchmark very closely but tech stocks have shown a significant outperformance in the last 5 years. A recent uptrend in certain sectors points to sector rotation and could be indicative of investors' outlook on the economy.


#### Data profile


***Dataset 1***

The first dataset we chose is the historical stock market data for popular stocks in the S&P 500 such as Nvidia Inc. (NVDA), JP Morgan Chase (JPM), Walmart (WMT),Tesla Inc.(TSLA), Amazon Inc. (AMZN), Broadcomm (AVGO), Caterpillar Inc. (CAT), Exxon Mobile (XOM), Johnson & Johnson (J&J), Abbot Inc. (ABT), and Prologis Inc. (PLD) from Yahoo Finance using the pypi yfinance python package 

**Consent:** This data is public market data, and doesn't involve human subjects so consent does not need to be obtained. The yfinance python library is free and open source that can be accessed through any Python programming interface


**Privacy/Confidentiality:** The dataset does not contain any personal or personally identifiable information. 

**Copyright:** Under its Terms of Service, we are allowed to use the dataset as long as it's not for commerical use, so using for educational purposes is acceptable (fair use) 

**Licenses:** This dataset is a proprietary license.  According to the Terms of Service, the data is allowed to be used as long as it follows the Terms and Conditions, and one is not allowed to sell or create something new based on this data. 

**Terms of Use:** The Terms of Service prohibit data scraping beyond API access.  The`yfinance` library complies with those rules.  


***Dataset 2***

The second dataset we chose is the historical S&P 500 Index data from the Federal Reserve Economic Data (FRED) database using the FRED API in monthly frequency starting January 2015 till date (~10 years)

**Consent:** This data is public market data, and doesn't involve human subjects so consent does not need to be obtained. The data was obtained by means of an API 

**Privacy/Confidentiality:** No personal data was used in the dataset.

**Copyright:** The FRED data is public domain and it's available for non-commercial research and for educational use 

**License:** The FRED data is a permissive license, meaning that it's available for everyone to use, but they request to be cited for using their data

For our detailed analysis of data lifecyle and ethical data handling, navigate to file `M1_M2.md`

#### Data quality: 

<u>Accuracy</u>: Yahoo finance and FRED are the gold standard of data providers for economic and financial data. They are reliable sources and are the go-to data sources across industries and objectives. 


<u>Timeliness</u>: The FRED and Yahoo databases are updated daily espcially for high frequency data so all the data is up to date at the time of data acquisition. Older, newer and alternative frequency data can be obtained by modifying the 'start date' and 'frequency'/'interval' paramaters. However, low frequency data such as monthly, quarterly or annual (As opposed to daily) will only be available up to the most recently completed month. Overall, the data is timely 


<u>Completeness</u>: Our datasets are broadly complete and have either no or very few missing values. Due to our data being time-oriented, missing values can be easily imputed through moving averages or by referencing alternative data sources

<u>Consistency</u>: No systematic syntactic flaws seem to be present in our data

#### Findings: 

We plotted the time series in our data i.e. we plotted our stocks and the S&P500 index. Nvidia Inc. (NVDA) outperformed the other stocks and the benchmark S&P500 by a significant margin, with the divergence in returns increasing exponentially between 2023 and now. The other stocks which stand out and have done exceptionally well in the last 5 years are Broadcom Inc. (AVGO) and Tesla (TSLA).
Stocks like Caterpillar (CAT) and Johnson & Johnson (JNJ) have been doing a little bit better in the recent past, indicating possible sector rotation amongst investors or positive earnings surprises. Other stocks have done moderately relative to the S&P500. Given an expected Fed rate cut in the near term, and emerging data on downbeat consumer confidence and bleak economic outlook, we expect defensive stocks in our data to outperform. We expect to see improved returns from Walmart, JP Morgan, Abbott, and Johnson & Johnson in the next 6-9 months. Other stocks will do moderately. Given the volatility of tech stocks as seen in the visualization in data/processed/performance_chart.png, we believe these stocks are extremely sensitive to earnings announcements and valuations. Nvidia has outperformed other stocks excessively and it is at a risk of getting torpedoed given its bubble-like valuation. Overall, analyzing and comparing the performance of such diverse stocks with the benchmark provides more insight into the returns of various industries and gives some indication on stock and sector performance going forward



#### Future work: 

<u>Lessons learned</u>: Given the wide scope of this project, something we learned is being organized because this project has several moving parts. We would recommend first going through the requirements.txt file to ensure that you have all the software dependencies installed. Then we would recommend reading through the documentation, and looking at our data quality assessments. Lastly, you should review our scripts and use our Snakemake files to replicate our findings. Refer to our reproducibility section for more guidance. 

<u>Future work</u>: While we have only used 11 stocks in our analysis, future work could extend our project in terms of scale and analyze a larger number of stocks. Although we used background knowledge and simple exploratory data visualizations to answer our research questions, our datasets are excellent and allow for analysis of tremendous depth. You can use Machine Learning and time series modeling methods for much more robust analysis.



#### Reproducing:
***Sequence of steps used in our project***:

1.  Importing libraries 
<ul>import yfinance as yf
import pandas as pd
import openpyxl
from fredapi import Fred
import pandas as pd
import matplotlib.pyplot as plt\
import hashlib</ul>

Documentation & Installation procedures:
<ul>yfinance: https://python-yahoofinance.readthedocs.io/en/latest/api.html

fredapi: https://pypi.org/project/fredapi/

Matplotlib: https://matplotlib.org/stable/index.html

Hashlib: https://docs.python.org/3/library/hashlib.html

</ul>



2. Loading dataset 1 using the `yfinance` library
(i) Create a list of tickers for the stocks we want to import
(ii) use the yf.download function to pull the stock data. Specify start date and data frequency (interval) parameters
(iii) Store the data in a csv file and convert to dataframe

3. Loading dataset 2 using the fredapi API pull
(i) Obtain an api key from the St.Louis FRED website
(ii) Use the .get_series function from the `fredapi` library to fetch the series. The S&P500 series id is 'SP500'. Similary, specify the series start date, (end date optional), and frequency parameters. Ensure a datetime index is present.
(iii) Store the data in a csv file and convert to dataframe

4. Data cleaning
* The S&P500 series requires no cleaning
* The data pulled from Yahoo finance has a multi-level schema. Level 1 of the schema contains price attributes (i.e. opening price, closing price, adjusted closing price, volume etc. on a given day) and level 2 of the schema contains the ticker symbol of the stock (NVDA, ABT, TSLA etc.). 
- create a function using `pd.MultiIndex` in `pandas` to format the schema and retrieve only the adjusted closing price for each stock which is what will be used in analysis. Other variables like 'opening price', 'high', 'low' etc. will not be used since they do not really give a holistic picture on stock returns. Adjusted closing prices are more accurate, stable representations of stock returns and can be used for historical analysis.
- Specify a datetime index for the dataframe to facilitate data integration
- store the cleaned dataset in a dataframe

5. Data Integration
* Use pd.merge to merge the two dataframes on the datetime index. 
Documentation : https://pandas.pydata.org/pandas-docs/stable/user_guide/merging.html

6. Data authenticity 
Use the hashlib library to assign a unique SHA256 checksum value to our merged dataframe

7. Workflow automation and provenance
Create a snakefile and use snakemake to create an automated end-to-end workflow

Documentation: https://snakemake.readthedocs.io/en/stable/

* Assign a checksum to the snakemake file to ensure file integrity so that if the checksum fails, it can indicate some corruption to the files. 

***Reproducing our results***

To reproduce our results on your operating system, you can run the terminal command `bash run all.sh` and our results will be reproduced on your computer or operating system even if software versions change because Snakemake runs the steps in isolated environments.

Navigate to `data/processed/dag.png` to view the directed acyclic graph for our workflow to visualize and better understand our process and replicate it yourself.

#### References:

**Yahoo Finance Data**

Source : https://finance.yahoo.com/markets/

yfinance library documentation: https://ranaroussi.github.io/yfinance/index.html


**FRED Data**

Pandas Requests Library Documentation: https://docs.python-requests.org/en/latest/index.html

FRED API Documentation: https://github.com/mortada/fredapi  

#### Metadata and Data Documentation
Our data involves time series and is very easy to interpret.
**Yahoo Finance dataset**
Each observation/row/tuple corresponds to a month and each of these observations are serially correlated. Each variable/attribute/column is the closing price of a stock in $ values on the last day of the month. 

Our observations start from January 2016 till November 2025

**FRED dataset**
Each observation/row/tuple corresponds to a month and each of these observations are serially correlated. Each variable/attribute/column is a number corresponding to the S&P 500 index level at close (4PM ET) on that given day. 

Our observations start from January 2016 till November 2025. The index data is not seasonally adjusted.

#### Validation using schema.org
We validated our FRED SP500 series using the schema.org metadata validation function and it meets all conformance standards.

However, when we passed the Yahoo finance datasets through the schema.org validator, it did not detect any metadata because there isn't any. There is only a minor note made on the Yahoo Finance website that the 'Adjusted close price is price adjusted for splits and dividend and/or capital gain distrubutions'. While the lack of a structured codebook is not ideal, this could be because there is essentially only one variable price and all its attributes such as open, close etc. are intuitive. 

  
    
