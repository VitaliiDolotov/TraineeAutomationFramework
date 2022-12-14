Feature: AddressManagement

Test cases related to the Address management functionality

Background:
	Given User is on Automation trainee website
	Then 'Users and Addresses' page is opened
	When User navigates to 'Add Address' page

				#  --- Address Creating ---
@Regression @AddAddress @AddAddressValidData
Scenario: CheckThatNewAddressCanBeCreated
	When User enters '<StreetAddressItem>' text to 'Street Address' input
	When User enters '<CityItem>' text to 'City' input
	When User enters '<StateItem>' text to 'State' input
	When User enters '<ZipCodeItem>' text to 'Zip Code' input
	When User clicks 'Create' button
	Then 'Users and Addresses' page is opened
		Then row with following data is displayed in 'Addresses' table
		| Column         | Data                |
		| Street Address | <StreetAddressItem> |
		| City           | <CityItem>          |
		| State          | <StateItem>         |
		| Zip Code       | <ZipCodeItem>       |
			# Data cleanup
	When User clicks 'Delete' button in 'Addresses' table for row with data
		| Column         | Data                |
		| Street Address | <StreetAddressItem> |
		| City           | <CityItem>          |
		| State          | <StateItem>         |
		| Zip Code       | <ZipCodeItem>       |
	When User clicks 'Yes' button
	@Regression @AddAddress @AddAddressValidData
	Examples: 
		| StreetAddressItem              | CityItem        | StateItem       | ZipCodeItem |
		| Red 8                          | New             | Ro              | 12345       |
		| Main-official Street street 46 | Набор-из букввв | Двадцать шестой | 00000       |
		| Перша вул., пров. восьмий 15/3 | City-Two        | Standard        | 54321       |
		| Second str. 1                  | Chicago         | Five`s          | 99999       |
				
				#  --- Address Deleting ---
	@Regression @DeleteAddress @AddAddressValidData
	Scenario: CheckThatAddressCanBeDeleted
		#Adding the new Address
	When User enters 'Third str. 3' text to 'Street Address' input
	When User enters 'Chicago' text to 'City' input
	When User enters 'Third' text to 'State' input
	When User enters '99999' text to 'Zip Code' input
	When User clicks 'Create' button
	Then 'Users and Addresses' page is opened
	Then row with following data is displayed in 'Addresses' table
		| Column         | Data         |
		| Street Address | Third str. 3 |
		| City           | Chicago      |
		| State          | Third        |
		| Zip Code       | 99999        |
		#Deleting the Address
	When User clicks 'Delete' button in 'Addresses' table for row with data
		| Column         | Data         |
		| Street Address | Third str. 3 |
		| City           | Chicago      |
		| State          | Third        |
		| Zip Code       | 99999        |
	Then 'Address delete confirmation' page is opened
	Then Delete message is displayed for 'Third str. 3' Address
	When User clicks 'Yes' button
	Then row with following data is not displayed in 'Addresses' table
		| Column         | Data         |
		| Street Address | Third str. 3 |
		| City           | Chicago      |
		| State          | Third        |
		| Zip Code       | 99999        |