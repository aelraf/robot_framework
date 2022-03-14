*** Settings ***
Documentation    Suite description

@{VARIABLE_LIST}  value_1  value_2
&{VARIABLE_DICT}  key-value  key_2-value_2


*** Test Cases ***
Something for lists
    ${LIST}  create list  value_1  value_2

    ${OTHER_LIST} create list
    append to list ${OTHER_LIST}
    ... value_1
    ... value_2
    

*** Keywords ***
Provided precondition
    Setup system under test