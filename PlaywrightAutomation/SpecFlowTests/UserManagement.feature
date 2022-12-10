Feature: UserManagement

Test cases related to the User management functionality

Background:
	Given User is on Automation trainee website
	Then 'Users and Addresses' page is opened

			#  --- User Creating ---
@Regression @AddUser
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

				#  --- User Updating ---
					@Regression @EditUser
Scenario: CheckThatUserCanBeEdited
	#Adding the new User
	When User navigates to 'Add User' page
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
					#!!!!!!!Check that user is created CAREFULLY!!!!!
	#@Regression @DeleteUser 
	#Scenario: CheckThatUserCanBeDeleted
#	When User clicks 'Delete' button in 'Users' table for row with data
#		| Column        | Data      |
#		| User Name     | Name      |
#		| Year of Birth | 1950      |
#		| Gender        | Undefined |
#	When User clicks 'Yes' button