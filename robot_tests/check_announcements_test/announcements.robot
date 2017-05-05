*** Settings ***
Documentation     A test suite with a single test for valid login.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          resource.robot

*** Test Cases ***
Announcements
    Open Browser To Login Page
    Input Username    mail1@example.com
    Input Password    password
    Submit Credentials
    Check Announcements
    [Teardown]    Close Browser
