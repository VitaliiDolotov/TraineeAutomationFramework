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
Scenario: CheckThatNewAddressCanBeCreated
	When User navigates to 'Add Address' page
	When User enters '580 Dr Martin Luther King' text to 'Street Address' input
	When User enters 'Newark' text to 'City' input
	When User enters 'NJ' text to 'State' input
	When User enters '71020' text to 'Zip Code' input
	When User clicks 'Create' button
	Then 'Users and Addresses' page is opened
	Then row with following data is displayed in 'Addresses' table
		| Column             | Data                            |
		| Street Address     | 580 Dr Martin Luther King       |
		| City               | Newark                          |
		| State              | NJ                              |
		| Zip Code           | 71020                           |
# Data cleanup
	When User clicks 'Delete' button in 'Addresses' table for row with data
		| Column             | Data                            |
		| Street Address     | 580 Dr Martin Luther King       |
		| City               | Newark                          |
		| State              | NJ                              |
		| Zip Code           | 71020                           |
	When User clicks 'Yes' button	

	@Regression
Scenario: CheckThatUserCanBeEdited
	When User navigates to 'Add User' page
	When User enters 'Peter' text to 'User Name' input
	When User enters '1961' text to 'Year of Birth' input
	When User clicks 'Create' button
	Then 'Users and Addresses' page is opened
	Then row with following data is displayed in 'Users' table
		| Column        | Data       |
		| User Name     | Peter      |
		| Year of Birth | 1961       |
		| Gender        | Undefined  |
		# Data edit
	When User clicks 'Edit' button in 'Users' table for row with data
		| Column        | Data       |
		| User Name     | Peter      |
		| Year of Birth | 1961       |
		| Gender        | Undefined  |
	When User enters '1999' text to 'Year of Birth' input
	When User clicks 'Update' button
	Then row with following data is displayed in 'Users' table
		| Column        | Data       |
		| User Name     | Peter      |
		| Year of Birth | 1999       |
		| Gender        | Undefined  |
	    # Data cleanup
	When User clicks 'Delete' button in 'Users' table for row with data
		| Column        | Data       |
		| User Name     | Peter      |
		| Year of Birth | 1999       |
		| Gender        | Undefined  |
	When User clicks 'Yes' button