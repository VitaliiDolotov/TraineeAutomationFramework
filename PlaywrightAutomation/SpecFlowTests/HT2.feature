Feature: HT2

Test cases related to the User management functionality

Background:
	Given User is on Automation trainee website
	Then 'Users and Addresses' page is opened

@Regression
Scenario: CheckThatUserCanBeEdited
When User clicks 'Edit' button in 'Users' table for row with data
		| Column        | Data      |
		| User Name     | Dasha     |
		| Year of Birth | 1992      |
		| Gender        | Female    |
	When User enters '2000' text to 'Year of Birth' input
	When User clicks 'Update' button
	Then 'Users and Addresses' page is opened
	Then row with following data is displayed in 'Users' table
		| Column        | Data      |
		| User Name     | Dasha     |
		| Year of Birth | 2000      |
		| Gender        | Female    |
	# Data cleanup
	When User clicks 'Edit' button in 'Users' table for row with data
		| Column        | Data      |
		| User Name     | Dasha     |
		| Year of Birth | 2000      |
		| Gender        | Female    |
	When User enters '1992' text to 'Year of Birth' input
	When User clicks 'Update' button