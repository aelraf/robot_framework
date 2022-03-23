*** Settings ***
Resource    own_keywords.resource

*** Test Cases ***
Sum Two Numbers
    ${result}=    My Own Sum Keyword    4    5
    Should Be Equal As Integers    ${result}    9
