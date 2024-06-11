*** Settings ***
Resource    ../../resources/locators/login/login_locators.robot
Resource    ../../resources/variables/variables.robot
Library    SeleniumLibrary


Suite Setup    Open Browser To Login Page
Suite Teardown    Close Browser

Test Setup    Login As Valid User

*** Test Cases ***
Verify Dashboard Loads Correctly
    [Documentation]    Ensure that the dashboard page loads correctly after login
    Page Should Contain Element    ${DASHBOARD_HEADER}

Verify User Profile Access
    [Documentation]    Ensure that the user can access their profile
    Click Element    ${PROFILE_BUTTON}
    Page Should Contain Element    ${PROFILE_PAGE_HEADER}

Test Teardown    Logout