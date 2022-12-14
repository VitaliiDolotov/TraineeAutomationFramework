Feature: 1

Test cases related to the Address management functionality

Background:
	Given User is on Automation trainee website
	Then 'Users and Addresses' page is opened

@Regression
Scenario: CheckThatNewAddresseCanBeCreated
	When User navigates to 'Add Address' page
	When User enters 'Topolina Street' text to 'Street Address' input
	When User enters 'Odesa' text to 'City' input
	When User enters 'Ukraine' text to 'State' input
	When User enters '09876' text to 'Zip Code' input
	When User clicks 'Create' button
	Then 'Users and Addresses' page is opened
	Then row with following data is displayed in 'Addresses' table
		| Column         | Data              |
		| Street Address | Topolina Street |
		| City           | Odesa              |
		| State          | Ukraine           |
		| Zip Code       | 09876             |
	# Data cleanup
	When User clicks 'Delete' button in 'Addresses' table for row with data
		| Column         | Data              |
		| Street Address | Topolina Street |
		| City           | Odesa              |
		| State          | Ukraine           |
		| Zip Code       | 09876             |
	When User clicks 'Yes' button