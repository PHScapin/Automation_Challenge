*** Settings ***
Library           SeleniumLibrary
Library           OperatingSystem
Resource          ../Variables/global_variables.robot

*** Keywords ***
clicking transfer button
    [Documentation]    Clicks on the transfer button located on the dashboard screen
    Wait Until Page Contains Element    id=btn-EXTRATO    timeout=10s
    Element Should Be Visible           id=btn-EXTRATO
    Click Element                       id=btn-EXTRATO
    Sleep    3

transfer screen is displayed
    [Documentation]    Verifies all the important elements from transfer screen
    Element Should Be Visible           css=input[name="accountNumber"]
    Element Should Be Visible           css=input[name="digit"]
    Element Should Be Visible           css=input[name="transferValue"]
    Element Should Be Visible           css=button[type="submit"]
    Element Text Should Be              css=button[type="submit"]    Transferir agora
    
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