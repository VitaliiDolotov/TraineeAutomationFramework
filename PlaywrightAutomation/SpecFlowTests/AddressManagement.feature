Feature: AddressManagement

Test cases related to the Address management functionality

Background:
	Given User is on Automation trainee website
	Then 'Users and Addresses' page is opened

			#  --- Address Creating ---
@Regression @AddAddress
Scenario: CheckThatNewAddressCanBeCreated
	When User navigates to 'Add Address' page
	When User enters 'Red 8' text to 'Street Address' input
	When User enters 'New' text to 'City' input
	When User enters 'Ro' text to 'State' input
	When User enters '12345' text to 'Zip Code' input
	When User clicks 'Create' button
	Then 'Users and Addresses' page is opened
	Then row with following data is displayed in 'Addresses' table
		| Column         | Data  |
		| Street Address | Red 8 |
		| City           | New   |
		| State          | Ro    |
		| Zip Code       | 12345 |
	# Data cleanup
	When User clicks 'Delete' button in 'Addresses' table for row with data
		| Column         | Data  |
		| Street Address | Red 8 |
		| City           | New   |
		| State          | Ro    |
		| Zip Code       | 12345 |
	When User clicks 'Yes' button