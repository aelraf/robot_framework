*** Settings ***
Documentation    Variables example.
Library    Collections


*** Test Cases ***
Variable With Library
    ${names}=    Create List    Janusz
    ...    Alicja    Natalia
    Sort List    ${names}
    Log    Imiona: ${names}


# lista dostępnych bibliotek
# http://robotframework.org/robotframework/
