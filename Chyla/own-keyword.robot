*** Test Cases ***
Sum two numbers
    ${result}=    My Own Sum Keyword    4    5
    Should Be Equal As Integers    ${result}    9

*** Keywords ***
My Own Sum Keyword
    [Documentation]    Add two numbers.
    [Arguments]    ${a}    ${b}
    ${w}=    Evaluate    ${a} + ${b}
    [Return]    ${w}
