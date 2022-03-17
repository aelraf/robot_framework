*** Settings ***
Library    JSONLibrary
Library    os
Library    Collections

*** Test Cases ***
First load JSON
    ${JSON_OBJ}=    load json from file    jsondata.json
    ${NAME_VALUE}=    get value from json    ${JSON_OBJ}    $.firstName

    log to console   ${\n}${NAME_VALUE[0]}
    should be equal    ${NAME_VALUE[0]}    John

    ${NAME_VALUE}=    get value from json    ${JSON_OBJ}    $.address.streetAddress

    log to console   ${\n}${NAME_VALUE[0]}
    should be equal    ${NAME_VALUE[0]}    21 2nd street