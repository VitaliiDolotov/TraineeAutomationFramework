Feature: UserManagement

Test cases related to the User management functionality

Background:
	Given User is on Automation trainee website
	Then 'Users and Addresses' page is opened

	@Regression
Scenario: CheckThatNewUserCanBeCreated
	When User navigates to 'Add User' page
	When User enters 'Andey' text to 'User Name' input
	When User enters '1989' text to 'Year of Birth' input
	When User clicks 'Create' button
	Then 'Users and Addresses' page is opened
	Then row with following data is displayed in 'Users' table
		| Column        | Data      |
		| User Name     | Andey     |
		| Year of Birth | 1989      |
		| Gender        | Undefined |

	@Regression
Scenario: CheckThatNewUserCanBeEdited
	When User clicks 'Edit' button in 'Users' table for row with data
	    | Column        | Data      |
		| User Name     | Andey     |
		| Year of Birth | 1989      |
		| Gender        | Undefined |
	When User enters 'Dimas' text to 'User Name' input
	When User enters '1991' text to 'Year of Birth' input
	When User clicks 'Update' button
	Then 'Users and Addresses' page is opened
	Then row with following data is displayed in 'Users' table
		| Column        | Data      |
		| User Name     | Dimas     |
		| Year of Birth | 1991      |
		| Gender        | Undefined |

	# Data cleanup
	When User clicks 'Delete' button in 'Users' table for row with data
		| Column        | Data      |
		| User Name     | Dimas      |
		| Year of Birth | 1991      |
		| Gender        | Undefined |
	When User clicks 'Yes' button

	@Regression
Scenario: CheckThatNewAddressCanBeCreated
	When User navigates to 'Add Address' page
	When User enters 'Storm' text to 'Street Address' input
	When User enters 'Sumy' text to 'City' input
	When User enters 'California' text to 'State' input
	When User enters '12345' text to 'Zip Code' input
	When User clicks 'Create' button
	Then 'Users and Addresses' page is opened
	Then row with following data is displayed in 'Addresses' table
		| Column        | Data      |
		| Street Address| Storm     |
		| City          | Sumy      |
		| State         | California|
		| Zip Code      | 12345     |
	# Data cleanup
	When User clicks 'Delete' button in 'Addresses' table for row with data
		| Column        | Data      |
		| Street Address| Storm     |
		| City          | Sumy      |
		| State         | California|
		| Zip Code      | 12345     |
	When User clicks 'Yes' button