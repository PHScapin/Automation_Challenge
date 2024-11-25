*** Settings ***
Library           SeleniumLibrary
Library           OperatingSystem
Resource          ../Variables/global_variables.robot

*** Keywords ***
on the homepage
    [Documentation]    Opens the login page with Chrome profile and logs into the system.
    ${chrome options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    ${user data dir}=    Set Variable    ${CHROME_PROFILE_PATH}
    ${user data dir}=    Evaluate    r'''${user data dir}'''.replace('\\\\', '/')  
    Call Method    ${chrome options}    add_argument    --user-data-dir\=${user data dir}
    Open Browser    ${BASE_URL}    Chrome    options=${chrome options}
    Execute Javascript    window.sessionStorage.clear();
    Maximize Browser Window
    Sleep               3
    Input Text         //input[@name='email']    ${VALID_USER}
    Input Text         //input[@name='password']    ${VALID_PASSWORD}
    Click Button       //button[contains(text(),'Acessar')]
    Wait Until Page Contains Element    //*[@id='textName']   timeout=${TIMEOUT}

clicking extract
    [Documentation]    Clicks on the extract button
    Click Element    id:btn-EXTRATO

extract appears
    [Documentation]    Verifies if the extract screen appears
    Wait Until Element Is Visible    css:.bank-statement__Container-sc-7n8vh8-0.esMdOU    timeout=10

on the extract page   
    [Documentation]    Opens the login page with Chrome profile and logs into the system, and enters the extract page.
    ${chrome options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    ${user data dir}=    Set Variable    ${CHROME_PROFILE_PATH}
    ${user data dir}=    Evaluate    r'''${user data dir}'''.replace('\\\\', '/')  
    Call Method    ${chrome options}    add_argument    --user-data-dir\=${user data dir}
    Open Browser    ${BASE_URL}    Chrome    options=${chrome options}
    Execute Javascript    window.sessionStorage.clear();
    Maximize Browser Window
    Sleep               3
    Input Text         //input[@name='email']    ${VALID_USER}
    Input Text         //input[@name='password']    ${VALID_PASSWORD}
    Click Button       //button[contains(text(),'Acessar')]
    Wait Until Page Contains Element    //*[@id='textName']   timeout=${TIMEOUT}
    Click Element    id:btn-EXTRATO

clicking back button
    [Documentation]    Verifies if the extract screen appears
    Wait Until Element Is Visible    id:btnBack    timeout=10
    Click Element    id:btnBack

verifying balance
    [Documentation]    Verifies if the balance is correctly displayed
    Wait Until Page Contains Element    css=div.bank-statement__ContainerBalance-sc-7n8vh8-9    timeout=10s

balance is displayed
    [Documentation]    The balance should appear in the correct format
    Element Should Be Visible    css=div.bank-statement__ContainerBalance-sc-7n8vh8-9


