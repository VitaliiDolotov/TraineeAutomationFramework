Feature: PageChanges

Test cases related to the page changing functionality

Background:
	Given User is on Automation trainee website
	Then 'Users and Addresses' page is opened

				#  --- 'Add User' page open ---
@Regression @AddUser @PageChanges @SmokeTests
Scenario: CheckThatAddUserPageCanBeOpened
	When User navigates to 'Add User' page
	Then 'Add User' page is opened

				#  --- 'Add Address' page open ---
@Regression @AddAddress @PageChanges @SmokeTests
Scenario: CheckThatAddAddressPageCanBeOpened
	When User navigates to 'Add Address' page
	Then 'Add Address' page is opened

				#  --- Main page is opened from 'Add User' page ---
@Regression @AddUser @PageChanges @SmokeTests
Scenario: CheckThatMainPageCanBeOpenedFromAddUserPage
	When User navigates to 'Add User' page
	Then 'Add User' page is opened
	When User navigates to 'Home' page
	Then 'Users and Addresses' page is opened

				#  --- Main page is opened from 'Add Address' page ---
@Regression @AddAddress @PageChanges @SmokeTests
Scenario: CheckThatMainPageCanBeOpenedFromAddAddressPage
	When User navigates to 'Add Address' page
	Then 'Add Address' page is opened
	When User navigates to 'Home' page
	Then 'Users and Addresses' page is opened