*** Settings ***
Library    JSONLibrary
Library    os
Library    Collections

*** Test Cases ***
Test title
    [Tags]    DEBUG
    Provided precondition
    When action
    Then check expectations

*** Keywords ***
Provided precondition
    Setup system under test