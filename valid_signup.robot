*** Settings ***
Documentation     A test suite with a single test for valid login.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          resource.robot

*** Test Cases ***
Valid Signup
    Open Browser To Landing Page
    Go To Signup Page
    Signup Page Should Be Open
    Input Email    doctor@who.com
    Input Password  tardis
    Input Password_Confirm  tardis
    Input Firstname		The
    Input Lastname		Doctor
    Input Department	Medicine
    Input Rank	Time Lord
    Input Contact	91777777771
    Submit Credentials
    Welcome Page Should Be Open
    Exit Page
    Landing Page Should Be Open
    Input Email  doctor@who.com
    Input Password  tardis
    Welcome Page Should Be Open
    [Teardown]    Close Browser
