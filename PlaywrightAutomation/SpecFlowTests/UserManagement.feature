Feature: UserManagement

Test cases related to the User management functionality

Background:
	Given User is on Automation trainee website
	Then 'Users and Addresses' page is opened

@Regression
Scenario: CheckThatNewUserCanBeCreated
	When User navigates to 'Add User' page
	When User enters 'Oleg' text to 'User Name' input
	When User enters '1989' text to 'Year of Birth' input
	When User clicks 'Create' button
	Then 'Users and Addresses' page is opened
	Then row with following data is displayed in 'Users' table
		| Column        | Data |
		| User Name     | Oleg |
		| Year of Birth | 1989 |
	# Data cleanup
	When User clicks 'Delete' button in 'Users' table for row with data
		| Column        | Data |
		| User Name     | Oleg |
		| Year of Birth | 1989 |
	When User clicks 'Yes' button