# biblioteka BuildIn

*** Settings ***
Documentation    Suite description


*** Test Cases ***
Test title
    [Tags]    DEBUG
    Provided precondition
    When action
    Then check expectations


*** Keywords ***
Przykladowe deklarowanie zmiennych
    Set Suite Variable    ${name1}    1
    Set Suite Variable    $name2    2
    Set Suite Variable    \${name3}    3

    # zachowanie normalnej ${zmiennej} zależy od możliwych istniejących wartości tej zmiennej,
    # dlatego dokumentacja zaleca używanie $variable albo \${variable}.


Wiele slow kluczowych akceptuje wyrazenia szacowane w pythonie
    Should Be True    len('${result}') > 3
    Run Keyword If    os.sep == '/'    Non-Windows Keyword
    ${version}=    Evaluate    robot.__version__
