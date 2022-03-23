*** Keywords ***
Suma
    [Documentation]    Add two numbers
    [Arguments]    ${a}    ${b}
    ${w}=    Evaluate    ${a} + ${b}
    [Return]    ${w}
