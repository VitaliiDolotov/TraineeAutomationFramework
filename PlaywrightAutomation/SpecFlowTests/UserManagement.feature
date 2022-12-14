Feature: UserManagement

Test cases related to the User management functionality

Background:
	Given User is on Automation trainee website
	Then 'Users and Addresses' page is opened

@Regression
Scenario: CheckThatNewUserCanBeCreated
	When User navigates to 'Add User' page
	When User enters 'Ben' text to 'User Name' input
	When User enters '2000' text to 'Year of Birth' input
	When User clicks 'Create' button
	Then 'Users and Addresses' page is opened
	Then row with following data is displayed in 'Users' table
		| Column        | Data      |
		| User Name     | Ben       |
		| Year of Birth | 2000      |
		| Gender        | Undefined |
	# Data cleanup
	When User clicks 'Delete' button in 'Users' table for row with data
		| Column        | Data      |
		| User Name     | Ben       |
		| Year of Birth | 2000      |
		| Gender        | Undefined |
	When User clicks 'Yes' button

@Regression
Scenario: CheckThatUserInfoCanBeEdited
	When User navigates to 'Add User' page
	When User enters 'Ben' text to 'User Name' input
	When User enters '2000' text to 'Year of Birth' input
	When User clicks 'Create' button
	Then 'Users and Addresses' page is opened
	Then row with following data is displayed in 'Users' table
		| Column        | Data      |
		| User Name     | Ben       |
		| Year of Birth | 2000      |
		| Gender        | Undefined |
	When User clicks 'Edit' button in 'Users' table for row with data
		| Column        | Data      |
		| User Name     | Ben       |
		| Year of Birth | 2000      |
		| Gender        | Undefined |
	When User enters '2001' text to 'Year of Birth' input 
	When User clicks 'Update' button
	Then 'Users and Addresses' page is opened
	Then row with following data is displayed in 'Users' table
		| Column        | Data      |
		| User Name     | Ben       |
		| Year of Birth | 2001      |
		| Gender        | Undefined |
	# Data cleanup
	When User clicks 'Delete' button in 'Users' table for row with data
		| Column        | Data      |
		| User Name     | Ben       |
		| Year of Birth | 2001      |
		| Gender        | Undefined |
	When User clicks 'Yes' button


	@Regression
Scenario: CheckThatNewAddressCanBeCreated
	When User navigates to 'Add Address' page
	When User enters '18 Chkalova' text to 'Street Address' input
	When User enters 'Kharkiv' text to 'City' input
	When User enters 'Kharkiv' text to 'State' input
	When User enters '63301' text to 'Zip Code' input
	When User clicks 'Create' button
	Then 'Users and Addresses' page is opened
	Then row with following data is displayed in 'Addresses' table
		| Column        | Data       |
		| Street Address| 18 Chkalova|
		| City          | Kharkiv    |
		| State         | Kharkiv    |
		| Zip Code      | 63301      |
		
	# Data cleanup
	When User clicks 'Delete' button in 'Addresses' table for row with data
		| Column        | Data       |
		| Street Address| 18 Chkalova|
		| City          | Kharkiv    |
		| State         | Kharkiv    |
		| Zip Code      | 63301      |
		
	When User clicks 'Yes' button