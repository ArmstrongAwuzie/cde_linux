# declaring params
url="https://www.stats.govt.nz/assets/Uploads/Annual-enterprise-survey/Annual-enterprise-survey-2023-financial-year-provisional/Download-data/annual-enterprise-survey-2023-financial-year-provisional.csv"
mkdir -p ./raw
mkdir -p ./transformed
mkdir -p ./gold 

# Downloading the file from the url
echo "Downloading file from the url ...."
curl -o ./raw/raw.csv $url

# Confirming download
test -f ./raw/raw.csv && echo "file successfully downloaded" || echo "No Such File"
#Renaming column 
sed -i 's/Variable_code/variable_code/g' ./raw/raw.csv

#Selelcting required columns 
cut -d ',' -f1,5,6,9 './raw/raw.csv' > ./transformed/2023_year_finance.csv
#move them to Gold folder
mv ./transformed/*.csv ./gold
test -f ./gold/2023_year_finance.csv && echo "File found" || echo "File not found"