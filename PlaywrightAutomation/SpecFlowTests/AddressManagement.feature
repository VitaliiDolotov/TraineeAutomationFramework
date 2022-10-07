Feature: AddressManagement

Testcases related to the Address management functionality

Background:
	Given User is on Automation trainee website
	Then 'Users and Addresses' page is opened

@Regression
Scenario: CheckThatNewAddressCanBeCreated
	When User navigates to 'Add Address' page
	When User enters '445 13th St N' text to 'Street Address' input
	When User enters 'Birmingham' text to 'City' input
	When User enters 'Alabama' text to 'State' input
	When User enters '21401' text to 'Zip Code' input
	When User clicks 'Create' button
	Then 'Users and Addresses' page is opened
	Then row with following data is displayed in 'Addresses' table
		| Column         | Data          |
		| Street Address | 445 13th St N |
		| City           | Birmingham    |
		| State          | Alabama       |
		| Zip Code       | 21401         |
	# Data cleanup
	When User clicks 'Delete' button in 'Addresses' table for row with data
		| Column         | Data          |
		| Street Address | 445 13th St N |
		| City           | Birmingham    |
		| State          | Alabama       |
		| Zip Code       | 21401         |
	When User clicks 'Yes' button