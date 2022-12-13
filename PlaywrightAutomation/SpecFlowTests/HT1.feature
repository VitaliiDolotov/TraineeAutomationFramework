Feature: HT1

Test cases related to the Address management functionality

Background:
	Given User is on Automation trainee website
	Then 'Users and Addresses' page is opened

@Regression
Scenario: CheckThatNewAddresseCanBeCreated
	When User navigates to 'Add Address' page
	When User enters 'Shevchenko Street' text to 'Street Address' input
	When User enters 'Kyiv' text to 'City' input
	When User enters 'Ukraine' text to 'State' input
	When User enters '08131' text to 'Zip Code' input
	When User clicks 'Create' button
	Then 'Users and Addresses' page is opened
	Then row with following data is displayed in 'Addresses' table
		| Column         | Data              |
		| Street Address | Shevchenko Street |
		| City           | Kyiv              |
		| State          | Ukraine           |
		| Zip Code       | 08131             |
	# Data cleanup
	When User clicks 'Delete' button in 'Addresses' table for row with data
		| Column         | Data              |
		| Street Address | Shevchenko Street |
		| City           | Kyiv              |
		| State          | Ukraine           |
		| Zip Code       | 08131             |
	When User clicks 'Yes' button