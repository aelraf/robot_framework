*** Settings ***
Documentation    Suite description


*** Variables ***
${BROWSER} Chrome
${DRIVER_EXECUTABLE} Drivers/chromedriver.exe


*** Test Cases ***
Test title
    [Tags]    DEBUG
    Provided precondition
    When action
    Then check expectations


*** Keywords ***
Provided precondition
    Open browser
    Setup system under test