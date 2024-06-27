*** Settings ***
Resource    ../../../../../common/resources/libraries/library.robot
Resource    ../../variables/general.robot
Resource    ../../locators/login/login_locators.robot
Resource    ../../variables/login/login_variables.robot

*** Keywords ***

Login As Admin
    Open Browser    ${BASE_URL}    chrome
    Wait Until Element Is Visible    ${txt_username}
    Input Text    ${txt_username}    qwqe
    Input Text    ${txt_password}    qwqe
    Click Element    ${btn_login_button}
    Page Should Contain    Đăng Nhập
    