Feature: HT1

Test cases related to the HT1 functionality

Background:
	Given User is on Automation trainee website
	Then 'Users and Addresses' page is opened

@Regression @AddressAction
Scenario: CheckAddAddress
	When User navigates to 'Add Address' page
	When User enters 'Street test' text to 'Street Address' input
	When User enters 'City-Test' text to 'City' input
	When User enters 'State-Test' text to 'State' input
	When User enters '66666' text to 'Zip Code' input
	When User clicks 'Create' button
	Then 'Users and Addresses' page is opened
	Then row with following data is displayed in 'Addresses' table
		| Column         | Data        |
		| Street Address | Street test |
		| City           | City-Test   |
		| State          | State-Test  |
		| Zip Code       | 66666       |
	# Data cleanup
	When User clicks 'Delete' button in 'Addresses' table for row with data
		| Column         | Data        |
		| Street Address | Street test |
		| City           | City-Test   |
		| State          | State-Test  |
		| Zip Code       | 66666       |
	When User clicks 'Yes' button

@Regression @UserAction
Scenario: CheckUpdateUser
	When User clicks 'Edit' button in 'Users' table for row with data
		| Column        | Data   |
		| User Name     | Dasha  |
		| Year of Birth | 1992   |
		| Gender        | Female |
	When User enters 'Michael' text to 'User Name' input
	When User enters '1969' text to 'Year of Birth' input
	When User clicks 'Update' button
	Then 'Users and Addresses' page is opened
	Then row with following data is displayed in 'Users' table
		| Column        | Data    |
		| User Name     | Michael |
		| Year of Birth | 1969    |
		| Gender        | Female  |
	#Rollback changes
	When User clicks 'Edit' button in 'Users' table for row with data
		| Column        | Data    |
		| User Name     | Michael |
		| Year of Birth | 1969    |
		| Gender        | Female  |
	When User enters 'Dasha' text to 'User Name' input
	When User enters '1992' text to 'Year of Birth' input
	When User clicks 'Update' button
	Then 'Users and Addresses' page is opened
	Then row with following data is displayed in 'Users' table
		| Column        | Data   |
		| User Name     | Dasha  |
		| Year of Birth | 1992   |
		| Gender        | Female |