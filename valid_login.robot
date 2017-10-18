*** Settings ***
Documentation     A test suite with a single test for valid login.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          resources.robot
Test Teardown     Close Browsers

*** Test Cases ***
Valid Login
    Open Browser To Login Page
    Input Username    sup@magicsw.com
    Input Password    Magic123
    Submit Credentials
    Dashboard Page Should Be Open
    [Teardown]    Close Browser

Open School List
	Open School List