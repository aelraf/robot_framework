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

# wychodzenie z pętli
Check for in range
    log to console  ${\n}Second list:
    :FOR   ${INDEX}   IN RANGE    0    10
    \  Exit for loop if   ${INDEX} == 9
    \  log to console  ${INDEX}


# symulujemy pętlę while
Check while loop
    ${RANDOM}  wait until keyword succeeds   10   1   Take random value
    log to console  Making sure that this is really one:
    log to console  ${RANDOM}


*** Keywords ***
# losuje nam jedną cyfrę, jeśli to jedynka, to zwraca True
Take random value
    ${RANDOM}  Generate random string   1  [NUMBERS]
    log to console  ${RANDOM}
    should be equal as integer  ${RANDOM}  1
    [Return]  ${RANDOM}