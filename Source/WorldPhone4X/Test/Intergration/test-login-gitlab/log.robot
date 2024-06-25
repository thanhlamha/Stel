*** Settings ***
Resource    ../../resources/locators/login/login_locators.robot
Resource    ../../resources/variables/general.robot
Resource    ../../resources/variables/login/login_variables.robot

Library    SeleniumLibrary

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
    [Tags]    Test
    [Timeout]    15s
    [Setup]    Open Browser    http://localhost:3000/login    chrome
    Page Should Contain    Home
    [Teardown]    Close Browser