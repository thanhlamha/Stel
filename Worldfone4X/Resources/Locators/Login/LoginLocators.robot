*** Variables ***
${txt_username}   (//input[@id='login-username'])
${txt_password}   (//input[@id='login-password'])
${txt_login_capcha}    (//input[@id='login-captcha'])
${btn_login_button}     (//*[@id='submitloginform'])
${tab_title}    //*[@data-name="titleTab" and contains(text(),<>)]