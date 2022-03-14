*** Settings ***
Resource  Settings/Keywords.robot
Library  DataDriver  ./SearchValues.csv

Test Template  Check main page search


# Robot interpretuje ... na początku wiersza jako kontynuacja wcześniejszej linii
Suite Setup  run keywords
...  User has accessed the website
...  User clicked search button
Suite Teardown  close browser


*** Test Cases ***
User write ${VALUE} into search


*** Keywords ***
Check main page search
    [Arguments]  ${VALUE}
    # tworzymy zmienną lokalną przez słowa kluczowe
    ${text}  set variable    I'm here!!!
    # tworzymy zmienną testową
    set test variable
    set suite variable
    Given User write ${VALUE} into search
    Then Search value should be   ${VALUE}
    And There should be ${VALUE} in search field