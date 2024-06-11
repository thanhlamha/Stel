*** Settings ***
Documentation    General resource file containing common keywords and variables
Library    SeleniumLibrary
Resource    ../variables/variables.robot

*** Keywords ***
Login
    [Arguments]    ${username}    ${password}
    [Documentation]    Logs into the application with given credentials
    Input Text    username_field    ${username}
    Input Text    password_field    ${password}
    Click Button    login_button