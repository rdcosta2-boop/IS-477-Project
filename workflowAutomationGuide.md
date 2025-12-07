# <u>(Optional) First Step:</u>  
You need to go to the snakefile and in the `config` parameter, you must put your own API key into the parameter `fred_api_key` to access the S&P 500 database.  Although one is given, it is best to have your own in case the current one is outdated.   


# <u>Next Steps:</u>
Next, you need to run this command in your terminal:

`bash run_all.sh`
  
## **IMPORTANT**   
If it's the first time running the workflow, the checksum will be inaccurate, so once you run it, copy the string that is found by navigating to **data/checkums/merged_df.sha** and paste it as value for `trusted_checksum` in the `config` parameter in the snakefile.

Then, run the workflow again by typing `snakemake --cores all`.  

Check the regression result by going to **data/checksums/regression_test_result.txt**, where it should say "`The calculated checksum (...) matches Trusted checksum (...)`", which confirms that the data has not been altered.  

# <u> Additional Information </u>    

You can view the final plot by navigating to **data/processed/performance_chart.png**.  

You can view the workflow diagram by naviagating to **data/processed/dag.png**.