### An update on each of the tasks described on your project plan including references to specific artifacts in your repository (such as datasets, scripts, workflows, workflow diagrams, etc).
Group: Emma and Rhea
Project Title: Comparing 10 year US stock returns to the S&P 500

In total, we were able to complete these tasks:

Data lifecycle (cf. Module 1)
<ul><li> Dataset information</li>
    <li>Planning, Acquisition, Processing, Preservation, and Publishing/Sharing assemessments of the Data lifecycle for each of our datasets</li>
</ul>
      
Ethical data handling (cf. Module 2) 
<ul><li> Evaluation of consent, privacy/confidentiality, copyright, licenses and terms of use for each of our datasets </li>
</ul>
Data collection and acquisition (cf. Module 3)
<ul><li> Pulled stock market data for 11 popular stocks (Nvidia, JP Morgan Chase, Walmart, Tesla, Amazon, Broadcomm, Caterpillar, Exxon Mobile, Johnson & Johnson, Abbot and Prologis from Yahoo Finance using the pypi yfinance package in Python) </li>
  <li> Used the requests library in Python and the FRED API to retrieve data for the S&P 500 Index for the last 10 years</li>
</ul>
Storage and organization (cf. Modules 4-5)
  <li>We converted both our datasets into tabular CSV format and gave a brief description about this data format </li>
 Data integration (cf. Module 7-8)
  <li>We used the pandas library in Python to merge the two </li>
  <li>We assigned a SHA-256 checksum to our merged dataset to ensure authenticity and integrity </li>
Data quality (cf. Module 9) 
  <li> We assessed our datasets based on Accuracy, Timeliness, Completeness, and Consistency  </li>


Based on feedback given on the project plan, we changed our datasets. We decided to use historical stock market data for 11 popular stocks from Yahoo Finance and historical data for the S&P 500 Index data from the Federal Reserve Economic Data (FRED) database. The datasets are both monthly starting from January 2015 to date.

### An updated timeline indicating the status of each task and when they will be completed.
We still need to complete:
<ul>
  <li> Extraction and enrichment (cf. Module 6) </li>
  <li> Data cleaning (cf. Module 10) </li>
  <li> Workflow automation and provenance (cf. Module 11-12) </li>
  <li> Reproducibility and transparency (cf. Module 13) </li>
  <li> Metadata and data documentation (cf. Module 15) </li>
  <li> Create README file </li>
</ul>

### UPDATED TIMELINE

Emma:
From here until the due date, I will complete the following based on our Project Plan:

<li> Metadata and data documentation (cf. Module 15) </li>
<li> Help create the README file </li>

Rhea:
From here until the due date, I will complete the following based on our Project Plan:
<li> Extraction and enrichment (cf. Module 6) </li>
<li> Data cleaning (cf. Module 10)</li>
<li> Workflow automatino and provenance (cf. Module 11-12)</li>
<li> Reproducibility and transparency (cf. Module 13)</li>
<li> Metadata and data documentation (cf. Module 15)</li>










### A description of any changes to your project plan itself, in particular about your progress so far. Also include changes you made to your plan based on feedback you may have received for Milestone 2.
*Each team member has to write a short summary of their contributions to the current milestone. Each team member should add and commit their contribution summary themselves to the shared github repo.*

Emma: We made some changes to the project plan.  As discussed earlier, we changed our datasets to the ones mentioned above.  I contributed doing Data lifecycle (cf. Module 1), Ethical data handling (cf. Module 2), Data collection and acquisition (cf. Module 3), and Data Integration (cf. Module 7-8).  

Rhea: I contributed to Data collection and acquisition (cf. Module 3), Storage and organization (cf. Modules 4-5), Data Inegration (cf. Module 7-8) in particular in the creation of the checksum, and Data Quality (cf. Module 9). Additionally, I made some minor changes and edits to Emma's work mentioned above in Modules 1 and 2  

#### Changes we made based on the feedback

The feedback we recieved said, "The stated project goal describes the assignment, but doesn't provide context for the research question. In your progress report, expand your project goal to explain the context of your proposed work (i.e., why are you interested in the specific research question? How do the datasets help you address the question?)"

In response to this feedback, we have decided to change our datasets.  We have pulled data for stocks from every sector and we want to answer the following questions:
<li>Which stocks and sectors have outperformed the S&P 500 in the last 10 years?</li>
<li>Can we make predictions for the S&P 500 using the 11 stocks in our portfolio?</li>

