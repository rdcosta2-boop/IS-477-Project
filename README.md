## **Title: Comparing 10 year US stock returns to the S&P 500**

Contributors: 
* Emma Bills (ebills2@illinois.edu)
* Rhea Dcosta (rdcosta2@illinois.edu)

  
#### Summary
Our project involves comparing stock market returns from 11 popular US stocks to the return on the S&P 500, a common equity benchmark, over the last 10 years. As a Finance + Data Science major, this area was personally relevant for me. For Emma, her motivation is a keen interest in the workings of the stock market. 
The research questions we have attempted to answer through this project are:
<ul>
<li>Which stocks and sectors have outperformed the S&P 500 in the last 10 years?</li>
<li>Can we make predictions for the S&P 500 using the 11 stocks in our portfolio?</li>
</ul>

We are interested in these specific research questions because we want to see if a group of certain stocks can outperform a broader market index, and the relationship between the two.  These datasets will help address the question by allowing us to analyze the trends in a specific timeframe (~a decade), and this will help us to explore the relationship between certain stocks and the S&P500.  We can then use this information to answer other questions, and this can lead to a deeper understanding of the data and the trends that are found.  


#### Data profile
[500-1000 words] Description of each dataset used including all ethical/legal constraints.

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


Data quality: [500-1000 words] Summary of the quality assessment and findings.



Findings: [~500 words] Description of any findings including numeric results and/or visualizations.



Future work: [~500-1000 words] Brief discussion of any lessons learned and potential future work.



#### Reproducing:
Sequence of steps used in our project:

1.  Importing libraries 
<ul>import yfinance as yf
import pandas as pd
import openpyxl</ul>


2. Loading dataset 1 using the `yfinance` library
(i) Create a list of tickers for the stocks we want to import
(ii) use the yf.download function to pull the stock data. Specify start date and data frequency (interval) parameters

3. 


References: Formatted citations for any papers, datasets, or software used in your project.
