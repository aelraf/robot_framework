*** Settings ***
Documentation    Variables section example.

*** Variables ***
${NAME}=    Jan
@{EXAMPLE_LIST}    1    2    3    a    b    c    4
&{EXAMPLE_DICT}    name=Jan    lastname=Kowalski

*** Test Case ***
Variable List Dict
    Log    ${NAME}
    Log    ${EXAMLPE_LIST}[1]
    Log    ${EXAMPLE_DICT}[name]

