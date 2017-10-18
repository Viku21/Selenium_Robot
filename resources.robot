*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported Selenium2Library.

Library           Selenium2Library

*** Variables ***
${SERVER}         magicbox.magicsw.com
${BROWSER}        Chrome
${DELAY}          0
${VALID USER}     	sup@magicsw.com
${VALID PASSWORD}	Magic123
${LOGIN URL}      	https://${SERVER}/login.htm?tenant=magic
${DASHBOARD URL}    https://${SERVER}/admin/dashboard.htm
${ERROR URL}      	https://${SERVER}/error.html

*** WebElements ***
${School}		School
${School List}	School List

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Login Page Should Be Open

Login Page Should Be Open
    Title Should Be    Login

Go To Login Page
    Go To    ${LOGIN URL}
    Login Page Should Be Open

Input Username
    [Arguments]    ${username}
    Input Text    j_username    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    j_password    ${password}

Submit Credentials
    Click Button    submit
	
Dashboard Page Should Be Open
	Location Should Be    ${DASHBOARD URL}
    Title Should Be    Dashboard
	
Open School List
	Click Element	| link=${School}
	Click Element   | link=${School List}

	