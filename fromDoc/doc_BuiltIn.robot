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

Evaluating expressions - Using variables
    # kiedy zmienna jest używana przy składni ${variable}, jej wartość jest zamieniana zanim
    # wyrażenie zostanie przybliżone, tzn wartość użyta w wyrażeniu będzie reprezentacją Stringową
    # wartości zmiennej, a nie samą wartością zmiennej.
    # to nie problem dla liczb oraz innych typów danych mających reprezentację String, mogącą być przybliżoną bezpośrednio

    # najważniejsze - string musi zawsze być w cudzysłowie, a jeśli zawiera znaki nowego wiersza -> w """ String """

    Should Be True    ${rc} < 10
    Run Keyword If    '${status}' == 'PASS'
    Run Keyword If    'FAIL' in '''${output}'''

    # zmienne zapisane w sposób $variable (czyli bez nawiasów) nie powinny być w cudzysłowie
    Should Be True    $rc < 10
    Run Keyword If    $status == 'PASS'
    Run Keyword If    'FAIL' in $output
    Should Be True    len($result) > 1 and $result[1] == 'OK'
    Should Be True    $result is not None


