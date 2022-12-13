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
		| Column        | Data      |
		| User Name     | Oleg      |
		| Year of Birth | 1989      |
		| Gender        | Undefined |
	# Data cleanup
	When User clicks 'Delete' button in 'Users' table for row with data
		| Column        | Data      |
		| User Name     | Oleg      |
		| Year of Birth | 1989      |
		| Gender        | Undefined |
	When User clicks 'Yes' button

@Regression
Scenario: Add Address
	When User navigates to 'Add Address' page
	When User enters '10 Airport Rd' text to 'Street Address' input
	When User enters 'Guernsey' text to 'City' input
	When User enters 'Wyoming' text to 'State' input
	When User enters '82214' text to 'Zip Code' input
	When User clicks 'Create' button
	Then 'Users and Addresses' page is opened
	Then row with following data is displayed in 'Addresses' table
		| Column		  | Data		   |
		| Street Address  | 10 Airport Rd  |
		| City			  | Guernsey       |
		| State           | Wyoming		   |
		| Zip Code        | 82214		   |
	# Data cleanup
	When User clicks 'Delete' button in 'Addresses' table for row with data
		| Column		  | Data		   |
		| Street Address  | 10 Airport Rd  |
		| City			  | Guernsey       |
		| State           | Wyoming		   |
		| Zip Code        | 82214		   |
	When User clicks 'Yes' button

	@Regression
Scenario: Edit User
	#Create User
	When User navigates to 'Add User' page
	When User enters 'James' text to 'User Name' input
	When User enters '1990' text to 'Year of Birth' input
	When User clicks 'Create' button
	Then 'Users and Addresses' page is opened
	Then row with following data is displayed in 'Users' table
		| Column        | Data      |
		| User Name     | James     |
		| Year of Birth | 1990      |
		| Gender        | Undefined |
	#Edit User

	When User clicks 'Edit' button in 'Users' table for row with data
		| Column        | Data      |
		| User Name     | James     |
		| Year of Birth | 1990      |
		| Gender        | Undefined |
	Then 'Edit User' page is opened
	When User enters 'Rafael' text to 'User Name' input
	When User enters '1995' text to 'Year of Birth' input
	When User clicks 'Update' button
	Then 'Users and Addresses' page is opened
	Then row with following data is displayed in 'Users' table
		| Column        | Data      |
		| User Name     | Rafael    |
		| Year of Birth | 1995      |
		| Gender        | Undefined |
	# Data cleanup
	When User clicks 'Delete' button in 'Users' table for row with data
		| Column        | Data      |
		| User Name     | Rafael    |
		| Year of Birth | 1995      |
		| Gender        | Undefined |
		When User clicks 'Yes' button

	@Regression
Scenario: Create User
	#Create User
	When User navigates to 'Add User' page
	When User enters 'Mike' text to 'User Name' input
	When User enters '1990' text to 'Year of Birth' input
	When User clicks 'Create' button
	Then 'Users and Addresses' page is opened
	Then row with following data is displayed in 'Users' table
		| Column        | Data      |
		| User Name     | Mike      |
		| Year of Birth | 1990      |
		| Gender        | Undefined |
	# Data cleanup
	When User clicks 'Delete' button in 'Users' table for row with data
		| Column        | Data      |
		| User Name     | Mike      |
		| Year of Birth | 1990      |
		| Gender        | Undefined |
		When User clicks 'Yes' button