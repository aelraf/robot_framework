*** Settings ***
Library    Selenium2Library


*** Variables ***
${USERNAME}    swtestacademy@gmail.com
${PASSWORD}    wrongpass
${BROWSER}    Chrome
${SiteUrl}    http://www.kariyer.net/
${DashboardTitle}  Title Title Title
${ExpectedWarningMessage}   Wrong password!
${WarningMessage}    Login Failed!
${Delay}    5s


*** Keywords ***
Provided precondition
    Setup system under test