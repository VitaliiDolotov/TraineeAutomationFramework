Feature: HT2

Test cases related to the HT2 functionality

Background:
	Given User is on Automation trainee website
	Then 'Users and Addresses' page is opened
	
@Regression
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
		| Gender        | Male    |
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