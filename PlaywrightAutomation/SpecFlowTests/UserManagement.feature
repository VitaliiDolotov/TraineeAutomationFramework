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

@Regression
Scenario: CheckThatNewUserCanBeEdited
	# Preconditions
	When User navigates to 'Add User' page
	When User enters 'Vitalii' text to 'User Name' input
	When User enters '1995' text to 'Year of Birth' input
	When User clicks 'Create' button
	# Scenario
	When User clicks 'Edit' button in 'Users' table for row with data
		| Column        | Data    |
		| User Name     | Vitalii |
		| Year of Birth | 1995    |
	Then 'Edit User' page is opened
	When User enters 'Vitalii Smith' text to 'User Name' input
	When User enters '2000' text to 'Year of Birth' input
	When User clicks 'Update' button
	Then row with following data is displayed in 'Users' table
		| Column        | Data          |
		| User Name     | Vitalii Smith |
		| Year of Birth | 2000          |
	# Data cleanup
	When User clicks 'Delete' button in 'Users' table for row with data
		| Column        | Data          |
		| User Name     | Vitalii Smith |
		| Year of Birth | 2000          |
	When User clicks 'Yes' button