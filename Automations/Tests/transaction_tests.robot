*** Settings ***
Library           SeleniumLibrary
Library           OperatingSystem
Resource          ../Resources/Keywords/login_keywords.robot
Resource          ../Resources/Variables/global_variables.robot
Resource          ../Resources/Keywords/transaction_keywords.robot
Test Teardown     Close Browser

*** Test Cases ***
Verify if transfer screen is available
    [Documentation]    Tries to open the transfer screen
    [Tags]    positive    transfer
    Given on the homepage
    When clicking transfer button
    Then transfer screen is displayed

# Durante os testes deste cenário, percebi que 'Given on the homepage' estava se comportando como:
# Given on the extract page. Pelas minhas pesquisas, percebi que isso pode estar acontecendo por conta do cache chrome_profile.
# Não tive tempo de verificar uma possível solução para este cenário, então irei parar por aqui.