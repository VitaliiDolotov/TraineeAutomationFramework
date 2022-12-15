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

		# Add address
	Scenario: CheckThatNewAddressCanBeCreated
	When User navigates to 'Add Address' page
	When User enters '121 Shmidt' text to 'Street Address' input
	When User enters 'New York' text to 'City' input
	When User enters 'NY' text to 'State' input
	When User enters '11235' text to 'Zip Code' input
	When User clicks 'Create' button
	Then 'Users and Addresses' page is opened
	Then row with following data is displayed in 'Addresses' table
		| Column        | Data      |
		| Street Address| 121 Shmidt|
		| City          | New York  |
		| State         | NY        |
		| Zip Code      | 11235     |
	# Data cleanup
	When User clicks 'Delete' button in 'Addresses' table for row with data
		| Column        | Data      |
		| Street Address| 121 Shmidt|
		| City          | New York  |
		| State         | NY        |
		| Zip Code      | 11235     |
	When User clicks 'Yes' button

	# Edit User
	Scenario: CheckThatUserCanBeEdited
	When User clicks 'Edit' button in 'Users' table for row with data
		| Column        | Data      |
		| User Name     | Oleg      |
		| Year of Birth | 1993      |
		| Gender        | Male      |
	When User enters 'Dima' text to 'User Name' input
	When User enters '1989' text to 'Year of Birth' input
	When User clicks 'Update' button
	Then 'Users and Addresses' page is opened
	Then row with following data is displayed in 'Users' table
		| Column        | Data      |
		| User Name     | Dima      |
		| Year of Birth | 1989      |
		| Gender        | Male      |
	# Data cleanup
	When User clicks 'Edit' button in 'Users' table for row with data
		| Column        | Data      |
		| User Name     | Dima      |
		| Year of Birth | 1989      |
		| Gender        | Male      |
	When User enters 'Oleg' text to 'User Name' input
	When User enters '1993' text to 'Year of Birth' input
	When User clicks 'Update' button
	Then 'Users and Addresses' page is opened
	Then row with following data is displayed in 'Users' table
		| Column        | Data      |
		| User Name     | Oleg      |
		| Year of Birth | 1993      |
		| Gender        | Male      |