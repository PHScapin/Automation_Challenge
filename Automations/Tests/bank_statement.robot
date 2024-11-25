*** Settings ***
Library           SeleniumLibrary
Library           OperatingSystem
Resource          ../Resources/Keywords/login_keywords.robot
Resource          ../Resources/Keywords/bank_keywords.robot
Resource          ../Resources/Variables/global_variables.robot
Test Teardown     Close Browser

*** Test Cases ***
Verify bank statement
    [Documentation]    Verifies if this screen is achiavable 
    [Tags]    bank_statement    positive
    Given on the homepage
    When clicking extract
    Then extract appears

Verify if back button works
    [Documentation]    Verifies if this button is working properly
    [Tags]    bank_statement    positive
    Given on the extract page
    When clicking back button
    Then the homepage is displayed

Verify if the balance is available
    [Documentation]    Verifies if the data is correctly displayed
    Given on the extract page
    When verifying balance
    Then balance is displayed

