*** Settings ***
Library           SeleniumLibrary
Library           OperatingSystem
Resource          ../Variables/global_variables.robot

*** Keywords ***
on the login page
    [Documentation]    Opens the login page with Chrome profile.
    ${chrome options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    ${user data dir}=    Set Variable    ${CHROME_PROFILE_PATH}
    ${user data dir}=    Evaluate    r'''${user data dir}'''.replace('\\\\', '/')  
    Call Method    ${chrome options}    add_argument    --user-data-dir\=${user data dir}
    Open Browser    ${BASE_URL}    Chrome    options=${chrome options}
    Maximize Browser Window
    Sleep               3

entering a valid user
    [Documentation]    Inputs valid user credentials and logs in.
    Input Text         //input[@name='email']    ${VALID_USER}
    Input Text         //input[@name='password']    ${VALID_PASSWORD}
    Click Button       //button[contains(text(),'Acessar')]
    Wait Until Page Contains Element    //*[@id='textName']   timeout=${TIMEOUT}

the homepage is displayed
    [Documentation]    Verifies that the user is on the homepage.
    Page Should Contain Element    //*[@id='textName']

registering a valid user
    [Documentation]    Registers a valid user with the provided information.
    Click Button       //button[contains(text(),'Registrar')]
    Sleep              3
    Input Text         //form[@class='styles__ContainerFormRegister-sc-7fhc7g-0 keVbpY']//input[@name='email']    ${VALID_USER}
    Input Text         //form[@class='styles__ContainerFormRegister-sc-7fhc7g-0 keVbpY']//input[@name='name']    ${FAKE_WORD}
    Input Text         //form[@class='styles__ContainerFormRegister-sc-7fhc7g-0 keVbpY']//input[@name='password']    ${VALID_PASSWORD}
    Input Text         //form[@class='styles__ContainerFormRegister-sc-7fhc7g-0 keVbpY']//input[@name='passwordConfirmation']    ${VALID_PASSWORD}
    Click Element      //label[@id='toggleAddBalance']
    Click Button       //form[@class='styles__ContainerFormRegister-sc-7fhc7g-0 keVbpY']//button[@type='submit']

user is created
    [Documentation]    Verifies that the user registration was successful.
    Page Should Contain Element    id=modalText

registering an invalid user without password confirmation
    [Documentation]    Tries to register an invalid user with the provided information
    Click Button       //button[contains(text(),'Registrar')]
    Sleep              3
    Input Text         //form[@class='styles__ContainerFormRegister-sc-7fhc7g-0 keVbpY']//input[@name='email']    ${FAKE_WORD}
    Input Text         //form[@class='styles__ContainerFormRegister-sc-7fhc7g-0 keVbpY']//input[@name='name']    ${FAKE_WORD}
    Input Text         //form[@class='styles__ContainerFormRegister-sc-7fhc7g-0 keVbpY']//input[@name='password']    ${FAKE_WORD}
    Click Element      //label[@id='toggleAddBalance']
    Click Button       //form[@class='styles__ContainerFormRegister-sc-7fhc7g-0 keVbpY']//button[@type='submit']


registering an invalid user without e-mail definition
    [Documentation]    Tries to register an invalid user with the provided information
    Click Button       //button[contains(text(),'Registrar')]
    Sleep              3
    Input Text         //form[@class='styles__ContainerFormRegister-sc-7fhc7g-0 keVbpY']//input[@name='password']    ${FAKE_WORD}
    Input Text         //form[@class='styles__ContainerFormRegister-sc-7fhc7g-0 keVbpY']//input[@name='name']    ${FAKE_WORD}
    Input Text         //form[@class='styles__ContainerFormRegister-sc-7fhc7g-0 keVbpY']//input[@name='passwordConfirmation']    ${FAKE_WORD}
    Click Element      //label[@id='toggleAddBalance']
    Click Button       //form[@class='styles__ContainerFormRegister-sc-7fhc7g-0 keVbpY']//button[@type='submit']


registering an invalid user without password definition
    [Documentation]    Tries to register an invalid user with the provided information
    Click Button       //button[contains(text(),'Registrar')]
    Sleep              3
    Input Text         //form[@class='styles__ContainerFormRegister-sc-7fhc7g-0 keVbpY']//input[@name='email']    ${FAKE_WORD}
    Input Text         //form[@class='styles__ContainerFormRegister-sc-7fhc7g-0 keVbpY']//input[@name='name']    ${FAKE_WORD}
    Input Text         //form[@class='styles__ContainerFormRegister-sc-7fhc7g-0 keVbpY']//input[@name='password']    ${FAKE_WORD}
    Click Element      //label[@id='toggleAddBalance']
    Click Button       //form[@class='styles__ContainerFormRegister-sc-7fhc7g-0 keVbpY']//button[@type='submit']  

user is not created
    [Documentation]    It shall appears the message showing that may have an missing field
     Page Should Contain Element    xpath=//*[contains(@class, "input__warging")]

entering an invalid user
    [Documentation]    Inputs invalid user credentials and logs in.
    Input Text         //input[@name='email']    ${FAKE_EMAIL}
    Input Text         //input[@name='password']    ${FAKE_WORD}
    Click Button       //button[contains(text(),'Acessar')]
    Sleep              3

an error message appears
    [Documentation]    It shall appears the message showing that this user does not exists
    Page Should Contain Element    xpath=//*[@id="modalText" and contains(@class, "styles__Text-sc-8zteav-4")]

clicking the exit button
    [Documentation]    It will try to click on the exit button 
    Click Element    id:btn-EXTRATO

 login page is displayed
    [Documentation]    Login page shall be displayed
    Wait Until Page Contains    O banco com bugs e falhas do seu jeito    timeout=10s