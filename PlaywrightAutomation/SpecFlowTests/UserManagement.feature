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
  When User enters '212 Fifth Avenue' text to 'Street Address' input
  When User enters 'New York' text to 'City' input
  When User enters 'USA' text to 'State' input
  When User enters '02138' text to 'Zip Code' input
  When User clicks 'Create' button
  Then 'Users and Addresses' page is opened
  Then row with following data is displayed in 'Addresses' table
    | Column         | Data             |
    | Street Address | 212 Fifth Avenue |
    | City           | New York         |
    | State          | USA              |
    | Zip Code       | 02138            |
  # Data cleanup
  When User clicks 'Delete' button in 'Addresses' table for row with data
    | Column         | Data             |
    | Street Address | 212 Fifth Avenue |
    | City           | New York         |
    | State          | USA              |
    | Zip Code       | 02138            |
  When User clicks 'Yes' button

	@Regression
Scenario: CheckThatNewUserCanBeEdited
	When User navigates to 'Add User' page
	When User enters 'Mariya' text to 'User Name' input
	When User enters '1999' text to 'Year of Birth' input
	When User clicks 'Create' button
	Then 'Users and Addresses' page is opened
	Then row with following data is displayed in 'Users' table
		| Column        | Data      |
		| User Name     | Mariya    |
		| Year of Birth | 1999      |
		| Gender        | Undefined |

	When User clicks 'Edit' button in 'Users' table for row with data
		| Column        | Data      |
		| User Name     | Mariya    |
		| Year of Birth | 1999      |
		| Gender        | Undefined |
	When User enters 'Nastya' text to 'User Name' input
	When User clicks 'Update' button 
	Then 'Users and Addresses' page is opened
	Then row with following data is displayed in 'Users' table
		| Column        | Data      |
		| User Name     | Nastya    |
		| Year of Birth | 1999      |
		| Gender        | Undefined |

	# Data cleanup
	When User clicks 'Delete' button in 'Users' table for row with data
		| Column        | Data      |
		| User Name     | Nastya    |
		| Year of Birth | 1999      |
		| Gender        | Undefined |
	When User clicks 'Yes' button

