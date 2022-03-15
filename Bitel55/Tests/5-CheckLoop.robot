*** Settings ***
Library   String

*** Test Cases ***
Check for loop
    log to console  ${\n}First list:
    ${FIRST_LIST}  create list
    ...  1
    ...  2
    ...  3
    ...  4
    ...  5
    :FOR  ${ELEMENT}  IN  @{FIRST_LIST}
    \  log to console  ${ELEMENT}
    take random value

#wychodzenie z pętli
Check for in range
    log to console  ${\n}Second list:
    :FOR   ${INDEX}   IN RANGE    0    10
    \  Exit for loop if   ${INDEX} == 9
    \  log to console  ${INDEX}



*** Keywords ***
Provided precondition
    Setup system under test