# Project-2-ETL
 Rothana Kim and Elizabeth Ho

   Project 2 focuses on restaurant inspection results we found from Kaggle. The final data base will be in pgadmin4 under the name “inspection_db”, with pgadmin4 being a relational database. The csv files provided us with the name and location information of the establishment, as well as results, grades, and types of violations found from inspections. Under violation related columns, they do provide types of inspections done along with risk levels. There also contain many na values so we will maintain key columns that are of importance while removing any columns that are not. We want to provide inspection results that would benefit the viewer for if they were to travel to that destination.

Sources:
LA Restaurant & Market Health Data
https://www.kaggle.com/datasets/cityofLA/la-restaurant-market-health-data?select=restaurant-and-market-health-inspections.csv

Chicago Food Inspections
https://www.kaggle.com/datasets/chicago/chicago-food-inspections?select=food-inspections.csv

DOHMH New York City Restaurant Inspection Results:
https://www.kaggle.com/datasets/new-york-city/nyc-inspections

SF Restaurant Scores - LIVES Standard
https://www.kaggle.com/datasets/san-francisco/sf-restaurant-scores-lives-standard	

---

New York Inspection CSV

The New York csv originally came with 399918 rows with 18 columns. The values in the zip code column containing a decimal place and the address being separated between building number and street. ‘DBA’ represents the name of the establishment, ‘CAMIS’ being the code assigned to the establishment and ‘RECORD DATE’ being the same throughout the data frame.

•	First started by making a copy of the original data frame so that the original data frame is not manipulate it in any way. 

•	Next, dropped any duplicates and filled in any missing value under the zipcode column with 0 and defined all the values within that column as integers.

•	Then, simplified the building and street columns into a new address column by combing the 2 columns. 

•	After organizing the columns, a .value_counts() was performed for the RECORD DATE column and got only 08/28/2017. I unselected the RECORD DATE column because it only describes the date the inspection results recorded into the file which is not needed.

---

San Francisco Inspection CSV

The San Francisco csv had 53973 rows with 23 columns. The latitude, longitude, location columns were filled with null values and the inspection_id was a combination of the building id and the inspection date. The violation_id was also a combination of the inspection date along with the violation id. The inspection_date included the timeframe, but all its values were at 0.

•	First, dropped all duplicate rows and got rid of unnecessary columns. 

•	The phone numbers within the column contained decimals which signified that the phone numbers were floats, so I turned those into strings to reveal the whole phone number. I later removed the decimals from the values.

•	Converted datetime from the inspection date column to just show the date.

•	Removed “business_” from the address, city, state, postal_code and phone_number columns to simplify and shorten the length of the data frame. 

•	Looking at the violation_id column, the actual id were the last 6 numbers for the element, so I cut the string to where the last 6 numbers were present, removing the inspection_id values from it.

---

Los Angeles Inspection CSV

  The inspection data had 67,573 rows and 20 columns. This data set was already very clean before I was able to make those few edits. The activity_date column contained the time but that was set to 0. There was a column called program_name which is meant to be the name of the restaurant.
  
•	Was able to drop the number of rows down to 67,541 rows by removing duplicates and NaN values. 

•	Updated the date format to remove the hours/minutes/seconds. 

•	Removed columns that didn’t relate to the violation codes. 

•	The serial number column in this CSV is unique for each inspection and is not ever duplicated. 

---

Los Angeles Violation Data CSV

  The violation data had 313,675 rows and 25 columns. All values were in capital letter format but that didn’t pose an issue. The Violation_description column includes the violation code within the description. Each row in this dataset describes the violation that was found on the establishment. The serial_number column refers to the same serial number as the inspection data data frame.
  
•	First the duplicates and NaNs were dropped.

•	The serial number has duplicates in this dataset because many businesses had multiple violations.

•	The final data frame includes 313,500 rows and 7 columns.

---

Chicago Inspection Data

  Unlike the LA data, the Chicago inspection data included both inspection and violation together. There was a DBA Name and an AKA Name column that both contained the name of the establishment the inspection was taken place, but AKA Name column did contain some null values. The location column contained both the latitude and longitude coordinates for the location even though there exist a latitude and longitude column.
  
•	This dataset started with 196,825 rows and 22 columns.

•	I dropped the duplicates in this dataset.

•	I did not drop the NaNs because every row had at least one NaN value.

•	I fixed the format of the Zip column by first filling the NA values in this column with 0, and then changing the type to integer.

•	I updated the date format to remove the hours/minutes/seconds.

•	My final dataframe includes 196,676 rows and 13 columns.

---

Database structure

  The la_inspection_data table uses the serial_number column as the primary key. This is used as a foreign key in the la_violation_data table. The data is structured this way so that each violation can exist as its own row. This allows us to join these tables and filter by any column such as violation code, zip code, score, status, etc.
	The nyc_data table contains the business information, score, grade, inspection date, inspection type, and record date broken out by violation codes. This means that each violation is in its own row in the same way that the la_violation_data table is structured.
  
  The sf_data table has the same structure as the nyc_data with each individual violation in its own row.

  The chicago_data table uses the inspection_id as the primary key. The inspection_id can be used as the primary key because all violations exist in one column together. This makes the data more difficult to read.

  Though all of our data is across four different cities, a user can use the union function in SQL to combine all of the cities together, save it as a view, and filter as needed.

============================================================================================

Room for improvement (Elizabeth Ho):

  I didn't merge the LA tables together in Jupyter Notebook because that's something that I'd prefer to do in SQL. They could be merged with the serial number in Jupyter Notebook but I would do something like this in SQL:
  
select

v.serial_number

,v.facility_name

,v.violation_code

,v.violation_description

,i.grade as "Inspection Grade"

,i.program_status

,i.record_id

from la_violation_data vjoin la_inspection_data i on i.serial_number=v.serial_number


Room for improvement (Rothana Kim):

  Although we wanted to include a json to extract from, some of the files we did find did not offer sufficient information that would support the main topic of the project and the idea of as to why we chose this. 
  I would want to later learn on how to change the formatting in a column in a way that information that is being presented would be in a list format, other than being in one sentence. 
  I also would like to have manipulated the phone numbers by putting it in (xxx) xxx-xxxx format but without would be fine too.
