Feature: UserManagement

Test cases related to the User management functionality

Background:
	Given User is on Automation trainee website
	Then 'Users and Addresses' page is opened
	When User navigates to 'Add User' page

			#  --- User Creating ---
@Regression @AddUser @AddUserValidData
Scenario: CheckThatNewUserCanBeCreated
	When User enters '<UserNameItem>' text to 'User Name' input
	When User enters '<YearItem>' text to 'Year of Birth' input
	When User clicks 'Create' button
	Then 'Users and Addresses' page is opened
	Then row with following data is displayed in 'Users' table
		| Column        | Data           |
		| User Name     | <UserNameItem> |
		| Year of Birth | <YearItem>     |
		| Gender        | Undefined      |
		# Data cleanup
	When User clicks 'Delete' button in 'Users' table for row with data
		| Column        | Data           |
		| User Name     | <UserNameItem> |
		| Year of Birth | <YearItem>     |
		| Gender        | Undefined      |
	When User clicks 'Yes' button
	@Regression @AddUser @AddUserValidData
	Examples: 
		| UserNameItem   | YearItem |
		| Ann            | 2004     |
		| Беар Удгар-Нью | 1900     |
		| Random--Имя    | 1952     |

				#  --- User Updating ---
@Regression @EditUser @AddUserValidData
Scenario: CheckThatUserCanBeEdited
		#Adding the new User
	When User enters 'Today' text to 'User Name' input
	When User enters '2000' text to 'Year of Birth' input
	When User clicks 'Create' button
	Then 'Users and Addresses' page is opened
	Then row with following data is displayed in 'Users' table
		| Column        | Data      |
		| User Name     | Today     |
		| Year of Birth | 2000      |
		| Gender        | Undefined |
		#Editing the added User
	When User clicks 'Edit' button in 'Users' table for row with data
		| Column        | Data      |
		| User Name     | Today     |
		| Year of Birth | 2000      |
		| Gender        | Undefined |
	Then 'Edit User' page is opened
	When User enters 'EditedName' text to 'User Name' input
	When User enters '1900' text to 'Year of Birth' input
	When User clicks 'Update' button
	Then 'Users and Addresses' page is opened
	Then row with following data is displayed in 'Users' table
		| Column        | Data       |
		| User Name     | EditedName |
		| Year of Birth | 1900       |
		| Gender        | Undefined  |
		 #Data cleanup
	When User clicks 'Delete' button in 'Users' table for row with data
		| Column        | Data       |
		| User Name     | EditedName |
		| Year of Birth | 1900       |
		| Gender        | Undefined  |
	When User clicks 'Yes' button

				#  --- User Deleting ---
@Regression @DeleteUser @AddUserValidData
	Scenario: CheckThatUserCanBeDeleted
		#Adding the new User
	When User enters 'Беар Удгар-Нью' text to 'User Name' input
	When User enters '1900' text to 'Year of Birth' input
	When User clicks 'Create' button
	Then 'Users and Addresses' page is opened
	Then row with following data is displayed in 'Users' table
		| Column        | Data           |
		| User Name     | Беар Удгар-Нью |
		| Year of Birth | 1900           |
		| Gender        | Undefined      |
		#Deleting the User
	When User clicks 'Delete' button in 'Users' table for row with data
		| Column        | Data           |
		| User Name     | Беар Удгар-Нью |
		| Year of Birth | 1900           |
		| Gender        | Undefined      |
	Then 'User delete confirmation' page is opened
	Then delete message is displayed for 'Беар Удгар-Нью' user
	When User clicks 'Yes' button
	Then row with following data is not displayed in 'Users' table
		| Column        | Data           |
		| User Name     | Беар Удгар-Нью |
		| Year of Birth | 1900           |
		| Gender        | Undefined      |