*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported Selenium2Library.
Library           Selenium2Library

*** Variables ***
${SERVER}         localhost:3000
${BROWSER}        Chrome
${DELAY}          0
${LANDING URL}    http://${SERVER}/
${WELCOME URL}    http://${SERVER}/
${SIGNUP URL}    http://${SERVER}/users

*** Keywords ***
Open Browser To Landing Page
    Open Browser    ${LANDING URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Landing Page Should Be Open

Go To Signup Page
    Click Button    signup_button

Signup Page Should Be Open
    Location Should Be    ${SIGNUP URL}

Input Username
    [Arguments]    ${email}
    Input Text    user_email    ${email}

Input Password
    [Arguments]    ${password}
    Input Text    user_password   ${password}

Input Password_Confirm
    [Arguments]    ${password_confirmation}
    Input Text    user_password_confirmation  ${password_confirmation}

Input Firstname
    [Arguments]    ${first_name}
    Input Text    user_first_name    ${first_name}

Input Lastname
    [Arguments]    ${last_name}
    Input Text    user_last_name    ${last_name}

Input Department
    [Arguments]    ${department}
    Input Text    user_department    ${department}

Input Rank
    [Arguments]    ${rank}
    Input Text    user_rank    ${rank}

Input Contact
    [Arguments]    ${contact_number}
    Input Text    user_contact_number    ${contact_number}

Submit Credentials
    Click Button  type="submit"

Welcome Page Should Be Open
    Location Should Be    ${WELCOME URL}
    Title Should Be    FRIA
    Page Should Contain   Signed in successfully.

Exit Page
    Click Button   logout_button

Landing Page Should Be Open
    Location Should Be    ${LANDING URL}
    Title Should Be    FRIA
    Page Should Contain   Signed out successfully.

Input Email
    [Arguments]    ${email}
    Input Text    user_email    ${email}

Input Password
    [Arguments]    ${password}
    Input Text    user_password    ${password}

Submit Credentials
    Click Button    login_button

Welcome Page Should Be Open
    Location Should Be    ${WELCOME URL}
    Title Should Be    FRIA
    Page Should Contain   Signed in successfully.