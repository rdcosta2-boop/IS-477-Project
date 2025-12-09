
echo "1. Installing Required Python stuff!!!"
# Install all the things you need like the Python downloads and libraries
pip install snakemake || { echo "Failed to install Snakemake, bye bye!!"; exit 1; }
pip install yfinance pandas fredapi matplotlib || { echo "Failed to install Python libraries, bye bye!!"; exit 1; }

echo ""
echo "2. Starting the Snakemake Workflow Execution!!!!!!"
echo "Note: It is expected that the first run will FAIL the regression test. Don't worry!! "
echo "If it fails, update the 'trusted_checksum' in the Snakefile!!!!!!!"

# Time to execute the main workflow
snakemake --cores all

if [ $? -eq 0 ]; then
    echo ""
    echo "YAYYYY IT IS COMPLETED!!!"
    echo "YOU CAN SEE THE OUTPUTS IN THE 'data' FILE:"
    echo " ** Visual Plot: data/processed/performance_chart.png"
    echo " ** Regression Test Result: data/checksums/regression_test_result.txt"
else
    echo ""
    echo "OH NO YOU FAILED!"
    echo "Check your error message"
    echo "if the regression test failed, read the **IMPORTANT** section within the additional steps that are listed in the "workflow_automation_guide.md" to update your trusted checksum."
fi