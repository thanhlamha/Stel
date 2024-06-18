*** Settings ***
Resource    ../../resources/locators/login/login_locators.robot
Resource    ../../resources/variables/general.robot
Resource    ../../resources/variables/login/login_variables.robot

Library    SeleniumLibrary
Library    ../../resources/utils/webdriver.py


*** Test Cases ***
WF4X-01 - Kiểm tra chức năng đăng nhập với trường username bỏ trống
    [Documentation]   WF4X-01 - Kiểm tra chức năng đăng nhập với trường username bỏ trống
    ...               Author: Lam Ha
    ...               Steps:
    ...               1. Mở URL :  https://omnicxm.worldfone.cloud/
    ...               2. Bỏ trống User name, nhập password và capcha
    ...               3. Click nút [Đăng Nhập]
    ...               
    ...               Expected
    ...               1. Hiển thị trang Đăng nhập.
    ...               2. N/A
    ...               3. Hiển thị thông báo lỗi "Thiếu giá trị các trường cần thiết/ Tài khoản"
    [Tags]    Login
    [Timeout]    15s
    [Setup]    Open Browser    ${BASE_URL}    firefox
    Wait Until Element Is Visible    ${txt_password}
    Input Text    ${txt_password}    qwqe
    Input Text    ${txt_loginCapcha}    qwqe
    Click Element    ${btn_login_button}
    Page Should Contain    ${missingFields}
    Page Should Contain    Tài khoản

    [Teardown]    Close Browser

WF4X-02 - Kiểm tra chức năng đăng nhập với trường password bỏ trống
    [Documentation]   WF4X-01 - Kiểm tra chức năng đăng nhập với trường username bỏ trống
    ...               Author: Lam Ha
    ...               Steps:
    ...               1. Mở URL :  https://omnicxm.worldfone.cloud/
    ...               2. Bỏ trống password, nhập username và capcha
    ...               3. Click nút [Đăng Nhập]
    ...               
    ...               Expected
    ...               1. Hiển thị trang Đăng nhập.
    ...               2. N/A
    ...               3. Hiển thị thông báo lỗi "Thiếu giá trị các trường cần thiết/ Mật khẩu"
    [Tags]    Login
    [Timeout]    15s
    [Setup]    Open Browser    ${BASE_URL}    firefox

    Wait Until Element Is Visible    ${txt_username}
    Input Text    ${txt_username}    qwqe
    Input Text    ${txt_loginCapcha}    qwqe
    Click Element    ${btn_login_button}
    Page Should Contain    ${missingFields}
    Page Should Contain    Mật khẩu

    [Teardown]    Close Browser


WF4X-03 - Kiểm tra chức năng đăng nhập với trường Capcha bỏ trống
    [Documentation]   WF4X-01 - Kiểm tra chức năng đăng nhập với trường username bỏ trống
    ...               Author: Lam Ha
    ...               Steps:
    ...               1. Mở URL :  https://omnicxm.worldfone.cloud/
    ...               2. Bỏ trống Capcha, nhập username và Password
    ...               3. Click nút [Đăng Nhập]
    ...               
    ...               Expected
    ...               1. Hiển thị trang Đăng nhập
    ...               2. N/A
    ...               3. Hiển thị thông báo lỗi "Thiếu giá trị các trường cần thiết/ Mã xác nhận"
    [Tags]    Login    BLOCK
    [Timeout]    15s
    [Setup]    Open Browser    ${BASE_URL}    firefox

    Wait Until Element Is Visible    ${txt_username}
    Input Text    ${txt_username}    qwqe
    Input Text    ${txt_password}    qwqe
    Click Element    ${btn_login_button}
    Page Should Contain    ${missingFields}
    Page Should Contain    Mã xác nhận

    [Teardown]    Close Browser

WF4X-04 - Kiểm tra chức năng đăng nhập với trường username và password bỏ trống
    [Documentation]   WF4X-01 - Kiểm tra chức năng đăng nhập với trường username bỏ trống
    ...               Author: Lam Ha
    ...               Steps:
    ...               1. Mở URL :  https://omnicxm.worldfone.cloud/
    ...               2. Bỏ trống Username, và Password, nhập capcha
    ...               3. Click nút [Đăng Nhập]
    ...               
    ...               Expected
    ...               1. Hiển thị trang Đăng nhập
    ...               2. N/A
    ...               3. Hiển thị thông báo lỗi "Thiếu giá trị các trường cần thiết / Tài khoản"
    [Tags]    Login
    [Timeout]    15s
    [Setup]    Open Browser    ${BASE_URL}    firefox

    Wait Until Element Is Visible    ${txt_login_capcha}
    Input Text    ${txt_login_capcha}    qwqe
    Click Element    ${btn_login_button}
    Page Should Contain    ${missingFields}
    Page Should Contain    Tài khoản

    [Teardown]    Close Browser

WF4X-05 - Kiểm tra chức năng đăng nhập với trường username, capcha và password bỏ trống.
    [Documentation]   WF4X-01 - Kiểm tra chức năng đăng nhập với trường username bỏ trống
    ...               Author: Lam Ha
    ...               Steps:
    ...               1. Mở URL :  https://omnicxm.worldfone.cloud/
    ...               2. Bỏ trống Username, Password, và capcha
    ...               3. Click nút [Đăng Nhập]
    ...               
    ...               Expected
    ...               1. Hiển thị trang Đăng nhập
    ...               2. N/A
    ...               3. Hiển thị thông báo lỗi "Thiếu giá trị các trường cần thiết / Tài khoản"
    [Tags]    Login
    [Timeout]    15s
    [Setup]    Open Browser    ${BASE_URL}    firefox

    Wait Until Element Is Visible    ${btn_login_button}
    Click Element    ${btn_login_button}
    Page Should Contain    ${missingFields}
    Page Should Contain    Tài khoản

    [Teardown]    Close Browser

WF4X-06 - Kiểm tra chức năng đăng nhập với trường username và Capcha bỏ trống
    [Documentation]   WF4X-01 - Kiểm tra chức năng đăng nhập với trường username bỏ trống
    ...               Author: Lam Ha
    ...               Steps:
    ...               1. Mở URL :  https://omnicxm.worldfone.cloud/
    ...               2. Bỏ trống Username, và Capcha, nhập mật khẩu
    ...               3. Click nút [Đăng Nhập]
    ...               
    ...               Expected
    ...               1. Hiển thị trang Đăng nhập
    ...               2. N/A
    ...               3. Hiển thị thông báo lỗi "Thiếu giá trị các trường cần thiết / Mật khẩu"
    [Tags]    Login
    [Timeout]    15s
    [Setup]    Open Browser    ${BASE_URL}    firefox

    Wait Until Element Is Visible    ${txt_password}
    Input Text    ${txt_password}    qwqe
    Click Element    ${btn_login_button}
    Page Should Contain    ${missingFields}
    Page Should Contain    Tài khoản

    [Teardown]    Close Browser

WF4X-07 - Kiểm tra chức năng đăng nhập với trường password và Capcha bỏ trống
    [Documentation]   WF4X-01 - Kiểm tra chức năng đăng nhập với trường username bỏ trống
    ...               Author: Lam Ha
    ...               Steps:
    ...               1. Mở URL :  https://omnicxm.worldfone.cloud/
    ...               2. Bỏ trống Username, và Capcha, nhập mật khẩu
    ...               3. Click nút [Đăng Nhập]
    ...               
    ...               Expected
    ...               1. Hiển thị trang Đăng nhập
    ...               2. N/A
    ...               3. Hiển thị thông báo lỗi "Thiếu giá trị các trường cần thiết / Mật khẩu"
    [Tags]    Login    ABC
    [Timeout]    15s
    [Setup]    Open Browser    ${BASE_URL}    firefox

    Wait Until Element Is Visible    ${txt_username}
    Input Text    ${txt_username}    qwqe
    Click Element    ${btn_login_button}
    Page Should Contain    ${missingFields}
    Page Should Contain    Mật khẩu

    [Teardown]    Close Browser

WF4X-08 Kiểm tra chức năng đăng nhập với trường Capcha không hợp lệ.
    [Documentation]   WF4X-08 Kiểm tra chức năng đăng nhập với trường Capcha không hợp lệ.
    ...               Author: Lam Ha
    ...               Steps:
    ...               2. Nhâp thông tin Username và Password.
    ...               3. Nhập thông tin Capcha không hợp lệ
    ...               4.. Click nút [Đăng Nhập]
    ...               
    ...               Expected
    ...               1. Hiển thị trang Đăng nhập
    ...               2. N/A
    ...               3. N/A
    ...               4. Hiển thị thông báo lỗi "Mã xác thực không chính xác"
    [Tags]    Login
    [Timeout]    15s
    [Setup]    Open Browser    ${BASE_URL}    firefox

    Wait Until Element Is Visible    ${txt_username}
    Input Text    ${txt_username}    abc
    Input Text    ${txt_password}    abc
    Input Text    ${txt_login_capcha}    abc
    Click Element    ${btn_login_button}
    Page Should Contain    ${invalidCapcha}    timeout=5s

    [Teardown]    Close Browser

WF4X-12 Kiểm tra chức năng đăng nhập với username, password và capcha không hợp lệ.
    [Documentation]   WF4X-12 Kiểm tra chức năng đăng nhập với username, password và capcha không hợp lệ.
    ...               Author: Lam Ha
    ...               Steps:
    ...               2. Nhâp thông tin username, password  và capcha không hợp lệ.
    ...               4. Click nút [Đăng Nhập]
    ...               
    ...               Expected
    ...               1. Hiển thị trang Đăng nhập
    ...               2. N/A 
    ...               3. Hiển thị thông báo lỗi "Mã xác thực không chính xác"
    [Tags]    Login
    [Timeout]    30s
    [Setup]    Open Browser    ${BASE_URL}    firefox

    Wait Until Element Is Visible    ${txt_username}
    Input Text    ${txt_username}    abc
    Input Text    ${txt_password}    abc
    Input Text    ${txt_login_capcha}    abc
    Click Element    ${btn_login_button}
    Page Should Contain    ${invalidCapcha}    timeout=5s
    
    [Teardown]    Close Browser