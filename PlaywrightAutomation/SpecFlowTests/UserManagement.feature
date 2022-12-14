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
          | Column | Data |
          | User Name | Oleg |
          | Year of Birth | 1989 |
          | Gender | Undefined |
    # Data cleanup
        When User clicks 'Delete' button in 'Users' table for row with data
          | Column | Data |
          | User Name | Oleg |
          | Year of Birth | 1989 |
          | Gender | Undefined |
        When User clicks 'Yes' button

    @Regression
    Scenario: CheckThatNewAddressCanBeAdded
        When User navigates to 'Add Address' page
        When User enters 'Circle Road' text to 'Street Address' input
        When User enters 'Reno' text to 'City' input
        When User enters 'Nevada' text to 'State' input
        When User enters '89433' text to 'Zip Code' input
        When User clicks 'Create' button
        Then 'Users and Addresses' page is opened
        Then row with following data is displayed in 'Addresses' table
          | Column | Data |
          | Street Address | Circle Road |
          | City | Reno |
          | State | Nevada |
          | Zip Code | 89433 |
    # Data cleanup
        When User clicks 'Delete' button in 'Addresses' table for row with data
          | Column | Data |
          | Street Address | Circle Road |
          | City | Reno |
          | State | Nevada |
          | Zip Code | 89433 |
        When User clicks 'Yes' button
        
    @Regression
    Scenario: CheckThatUserCanBeEdited
    # User creation
        When User navigates to 'Add User' page
        When User enters 'Anna' text to 'User Name' input
        When User enters '1996' text to 'Year of Birth' input
        When User clicks 'Create' button
        Then 'Users and Addresses' page is opened
        Then row with following data is displayed in 'Users' table
          | Column | Data |
          | User Name | Anna |
          | Year of Birth | 1996 |
          | Gender | Undefined |
    # Data editing
        When User clicks 'Edit' button in 'Users' table for row with data
          | Column | Data |
          | User Name | Anna |
          | Year of Birth | 1996 |
          | Gender | Undefined |
        When User enters 'Olek' text to 'User Name' input
        When User enters '1995' text to 'Year of Birth' input
        When User clicks 'Update' button
        Then 'Users and Addresses' page is opened
        Then row with following data is displayed in 'Users' table
          | Column | Data |
          | User Name | Olek |
          | Year of Birth | 1995 |
          | Gender | Undefined |
    # Data cleanup
        When User clicks 'Delete' button in 'Users' table for row with data
          | Column | Data |
          | User Name | Olek |
          | Year of Birth | 1995 |
          | Gender | Undefined |
        When User clicks 'Yes' button