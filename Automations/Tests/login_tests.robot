*** Settings ***
Library           SeleniumLibrary
Library           OperatingSystem
Resource          ../Resources/Keywords/login_keywords.robot
Resource          ../Resources/Variables/global_variables.robot
Resource          ../Resources/Keywords/bank_keywords.robot
Test Teardown     Close Browser

*** Test Cases ***
Unsuccessfully Register a User without password confirmation
    [Documentation]    Scenario: Tries to register a user with missing fields.
    [Tags]             register    negative
    Given on the login page
    When registering an invalid user without password confirmation
    Then user is not created

Unsuccessfully Register a User without e-mail definition
    [Documentation]    Scenario: Tries to register a user missing e-mail.
    [Tags]             register    negative
    Given on the login page
    When registering an invalid user without password confirmation
    Then user is not created

Unsuccessfully Register a User without password definition
    [Documentation]    Scenario: Tries to register a user missing password.
    [Tags]             register    negative
    Given on the login page
    When registering an invalid user without password confirmation
    Then user is not created
    
Successfully Register a User
    [Documentation]    Scenario: Successfully registers a user.
    [Tags]             register    positive
    Given on the login page
    When registering a valid user
    Then user is created

Unsuccessfully Login with Invalid Credentials
    [Documentation]    Scenario: Successfully registers a user.
    [Tags]             login    negative
    Given on the login page
    When entering an invalid user
    Then an error message appears

Successfully Login with Valid Credentials
    [Documentation]    Scenario: Tries to login with a valid user and password.
    [Tags]             login    positive
    Given on the login page
    When entering a valid user
    Then the homepage is displayed

Exit the system
    [Documentation]    Scenario: Tries to logout from the system
    [Tags]             login    positive
    Given on the dashboard page
    When clicking the exit button
    Then login page is displayed