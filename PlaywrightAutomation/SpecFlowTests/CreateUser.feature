﻿Feature: CreateUser

Test cases related to the User creation functionality

Background:
	Given User is on Automation trainee website
	Then 'Users and Addresses' page is opened

@Regression
Scenario: CheckThatNewUserCanBeCreated
	When User navigates to 'Add User' page
	When User enters 'Vitalii' text to 'User Name' input
	When User enters '1989' text to 'Year of Birth' input
	When User clicks 'Add User' button
	Then 'Users and Addresses' page is opened
	Then following data is displayed in 'Users' table
		| Column        | Data    |
		| User Name     | Vitalii |
		| Year of Birth | 1989    |
	When User clicks 'Delete' button in 'Users' table for row with data
		| Column        | Data    |
		| User Name     | Vitalii |
		| Year of Birth | 1989    |
	Then 'User delete confirmation' page is opened
	Then delete message is displayed for 'Vitalii' user
	When User clicks 'Yes' button
	Then 'Users and Addresses' page is opened
