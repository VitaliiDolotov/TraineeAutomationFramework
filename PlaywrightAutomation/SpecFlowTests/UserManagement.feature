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
	When User enters '17677 Mack Ave' text to 'Street Address' input
	When User enters 'Detroit' text to 'City' input
	When User enters 'Michigan' text to 'State' input
	When User enters '48224' text to 'Zip Code' input
	When User clicks 'Create' button
	Then 'Users and Addresses' page is opened
	Then row with following data is displayed in 'Addresses' table
		| Column        | Data           |
		| Street Address| 17677 Mack Ave |
		| City          | Detroit        |
		| State         | Michigan       |
		| Zip Code      | 48224          |
		
	# Data cleanup
	When User clicks 'Delete' button in 'Addresses' table for row with data
		| Column        | Data           |
		| Street Address| 17677 Mack Ave |
		| City          | Detroit        |
		| State         | Michigan       |
		| Zip Code      | 48224          |
	When User clicks 'Yes' button

@Regression
Scenario: CheckEditUserFunctionality
	When User clicks 'Edit' button in 'Users' table for row with data
		| Column        | Data      |
		| User Name     | Oleg      |
		| Year of Birth | 1993      |
		| Gender        | Male      |
	Then 'Edit User' page is opened
	When User enters 'Ivan' text to 'User Name' input
	When User enters '1991' text to 'Year of Birth' input
	When User clicks 'Update' button
	Then 'Users and Addresses' page is opened
	Then row with following data is displayed in 'Users' table
		| Column        | Data      |
		| User Name     | Ivan      |
		| Year of Birth | 1991      |
		| Gender        | Male      |
	# Rollback of data changes
	When User clicks 'Edit' button in 'Users' table for row with data
		| Column        | Data      |
		| User Name     | Ivan      |
		| Year of Birth | 1991      |
		| Gender        | Male      |
	Then 'Edit User' page is opened
	When User enters 'Oleg' text to 'User Name' input
	When User enters '1993' text to 'Year of Birth' input
	When User clicks 'Update' button
	Then 'Users and Addresses' page is opened
	Then row with following data is displayed in 'Users' table
		| Column        | Data      |
		| User Name     | Oleg      |
		| Year of Birth | 1993      |
		| Gender        | Male      |

@Regression
Scenario: CheckAddUserCancelFunctionality
	When User navigates to 'Add User' page
	When User enters 'Oleg' text to 'User Name' input
	When User enters '1989' text to 'Year of Birth' input
	When User clicks 'Cancel' button
	Then 'Users and Addresses' page is opened

@Regression
Scenario: CheckAddAddressCancelFunctionality
	When User navigates to 'Add Address' page
	When User enters '17677 Mack Ave' text to 'Street Address' input
	When User enters 'Detroit' text to 'City' input
	When User enters 'Michigan' text to 'State' input
	When User enters '48224' text to 'Zip Code' input
	When User clicks 'Cancel' button
	Then 'Users and Addresses' page is opened

@Regression
Scenario: CheckAddUserName3Characters1900YoB
	When User navigates to 'Add User' page
	When User enters 'Tom' text to 'User Name' input
	When User enters '1900' text to 'Year of Birth' input
	When User clicks 'Create' button
	Then 'Users and Addresses' page is opened
	Then row with following data is displayed in 'Users' table
		| Column        | Data      |
		| User Name     | Tom      |
		| Year of Birth | 1900      |
		| Gender        | Undefined |
	# Data cleanup
	When User clicks 'Delete' button in 'Users' table for row with data
		| Column        | Data      |
		| User Name     | Tom      |
		| Year of Birth | 1900      |
		| Gender        | Undefined |
	When User clicks 'Yes' button

@Regression
Scenario: CheckAddUserName4Characters1901YoB
	When User navigates to 'Add User' page
	When User enters 'Oleg' text to 'User Name' input
	When User enters '1901' text to 'Year of Birth' input
	When User clicks 'Create' button
	Then 'Users and Addresses' page is opened
	Then row with following data is displayed in 'Users' table
		| Column        | Data      |
		| User Name     | Oleg     |
		| Year of Birth | 1901      |
		| Gender        | Undefined |
	# Data cleanup
	When User clicks 'Delete' button in 'Users' table for row with data
		| Column        | Data      |
		| User Name     | Oleg     |
		| Year of Birth | 1901      |
		| Gender        | Undefined |
	When User clicks 'Yes' button

@Regression
Scenario: CheckAddUserName14Characters2004YoB
	When User navigates to 'Add User' page
	When User enters 'KAfffTuiopfgew' text to 'User Name' input
	When User enters '2004' text to 'Year of Birth' input
	When User clicks 'Create' button
	Then 'Users and Addresses' page is opened
	Then row with following data is displayed in 'Users' table
		| Column        | Data               |
		| User Name     | KAfffTuiopfgew     |
		| Year of Birth | 2004               |
		| Gender        | Undefined          |
	# Data cleanup
	When User clicks 'Delete' button in 'Users' table for row with data
		| Column        | Data               |
		| User Name     | KAfffTuiopfgew     |
		| Year of Birth | 2004               |
		| Gender        | Undefined          |
	When User clicks 'Yes' button

@Regression
Scenario: CheckAddUserName13Characters2003YoB
	When User navigates to 'Add User' page
	When User enters 'KAfffTuiopfge' text to 'User Name' input
	When User enters '2003' text to 'Year of Birth' input
	When User clicks 'Create' button
	Then 'Users and Addresses' page is opened
	Then row with following data is displayed in 'Users' table
		| Column        | Data               |
		| User Name     | KAfffTuiopfge      |
		| Year of Birth | 2003               |
		| Gender        | Undefined          |
	# Data cleanup
	When User clicks 'Delete' button in 'Users' table for row with data
		| Column        | Data               |
		| User Name     | KAfffTuiopfge      |
		| Year of Birth | 2003               |
		| Gender        | Undefined          |
	When User clicks 'Yes' button

@Regression
Scenario: CheckAddAddressStreetAddress(30)City(15)State(15)
	When User navigates to 'Add Address' page
	When User enters '3012AbracadabraAbracadabrawwww' text to 'Street Address' input
	When User enters 'WDetroitforever' text to 'City' input
	When User enters 'GMVVVVVVWWQDwww' text to 'State' input
	When User enters '48224' text to 'Zip Code' input
	When User clicks 'Create' button
	Then 'Users and Addresses' page is opened
	Then row with following data is displayed in 'Addresses' table
		| Column        | Data                          |
		| Street Address| 3012AbracadabraAbracadabrawwww|
		| City          | WDetroitforever               |
		| State         | GMVVVVVVWWQDwww               |
		| Zip Code      | 48224                         |
		
	# Data cleanup
	When User clicks 'Delete' button in 'Addresses' table for row with data
		| Column        | Data                          |
		| Street Address| 3012AbracadabraAbracadabrawwww|
		| City          | WDetroitforever               |
		| State         | GMVVVVVVWWQDwww               |
		| Zip Code      | 48224                         |
	When User clicks 'Yes' button

@Regression
Scenario: CheckAddAddressStreetAddress(29)City(14)State(14)
	When User navigates to 'Add Address' page
	When User enters '3012AbracadabraAbracadabrawww' text to 'Street Address' input
	When User enters 'WDetroitforeve' text to 'City' input
	When User enters 'GMVVVVVVWWQDww' text to 'State' input
	When User enters '48224' text to 'Zip Code' input
	When User clicks 'Create' button
	Then 'Users and Addresses' page is opened
	Then row with following data is displayed in 'Addresses' table
		| Column        | Data                          |
		| Street Address| 3012AbracadabraAbracadabrawww |
		| City          | WDetroitforeve                |
		| State         | GMVVVVVVWWQDww                |
		| Zip Code      | 48224                         |
		
	# Data cleanup
	When User clicks 'Delete' button in 'Addresses' table for row with data
		| Column        | Data                          |
		| Street Address| 3012AbracadabraAbracadabrawww |
		| City          | WDetroitforeve                |
		| State         | GMVVVVVVWWQDww                |
		| Zip Code      | 48224                         |
	When User clicks 'Yes' button

@Regression
Scenario: CheckAddAddressStreetAddress(5)City(3)State(2)ZipCodePattern
	When User navigates to 'Add Address' page
	When User enters '123Ye' text to 'Street Address' input
	When User enters 'Dem' text to 'City' input
	When User enters 'MI' text to 'State' input
	When User enters '12345-6789' text to 'Zip Code' input
	When User clicks 'Create' button
	Then 'Users and Addresses' page is opened
	Then row with following data is displayed in 'Addresses' table
		| Column        | Data      |
		| Street Address| 123Ye     |
		| City          | Dem       |
		| State         | MI        |
		| Zip Code      | 12345-6789|
		
	# Data cleanup
	When User clicks 'Delete' button in 'Addresses' table for row with data
		| Column        | Data      |
		| Street Address| 123Ye     |
		| City          | Dem       |
		| State         | MI        |
		| Zip Code      | 12345-6789|
	When User clicks 'Yes' button

@Regression
Scenario: CheckAddAddressStreetAddress(6)City(4)State(3)
	When User navigates to 'Add Address' page
	When User enters '123Yea' text to 'Street Address' input
	When User enters 'Demo' text to 'City' input
	When User enters 'MIC' text to 'State' input
	When User enters '48224' text to 'Zip Code' input
	When User clicks 'Create' button
	Then 'Users and Addresses' page is opened
	Then row with following data is displayed in 'Addresses' table
		| Column        | Data       |
		| Street Address| 123Yea     |
		| City          | Demo       |
		| State         | MIC        |
		| Zip Code      | 48224      |
		
	# Data cleanup
	When User clicks 'Delete' button in 'Addresses' table for row with data
		| Column        | Data       |
		| Street Address| 123Yea     |
		| City          | Demo       |
		| State         | MIC        |
		| Zip Code      | 48224      |
	When User clicks 'Yes' button