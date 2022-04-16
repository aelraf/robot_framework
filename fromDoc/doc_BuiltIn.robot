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

    Should Be Equal    ${x}    ${y}
    # wyrażenia regularne:
    # * - dowolny ciąg znaków, także pusty string
    # ? - dowolny pojedynczy znak
    # [znaki] - oznacza pojedynczy znak z wymienionych w nawiasie
    # [!znaki] - oznacza pojedynczy znak z niewymienionych w nawiasie
    # [a-z] - oznacza jeden znak z zakresu w nawiasie
    # [!a-z] - oznacza jeden znak nie z zakresu w nawiasie


Boolean arguments
    Should Be Equal    ${x}    ${y}    # Custom error    values=True
    Should Be Equal    ${x}    ${y}    # Custom error    values=yes
    Should Be Equal    ${x}    ${y}    # Custom error    values=${TRUE}
    Should Be Equal    ${x}    ${y}    # Custom error    values=${42}


Multiline string comparison
    ${first} =     Catenate    SEPARATOR=\n    # Not in second    Same    Differs1    Same
    ${second} =    Catenate    SEPARATOR=\n    # Same    Differs2    Same    Not in first
    Should Be Equal    ${first}    ${second}


# Keywordy z tej klasy:
Call Method examples
    ${isempty}=    Call Method    ${hashable}    isEmpty
    Should Not Be True    ${isempty}
    ${value}=    Call Method    ${hashable}    get    myname
    Should Be Equal    ${value}    myvalue
    Call Method    ${object}    kwargs    name=value    foo=bar
    Call Method    ${object}    positional    escaped\=equals


Catenate exaples
    ${str}=    Catenate    Hello    world
    ${str}=    Catenate    SEPARATOR=---    Hello    world
    ${str}=    Catenate    SEPARATOR=       Hello    world


Continue For Loop Examples
    FOR    ${var}    IN    @{VALUES}
        Run Keyword If    '${var}'=='CONTINUE'    Continue For Loop
        Do Something    ${var}
    END


Continue For Loop If Examples
    FOR    ${var}    IN    @{VALUES}
        Continue For Loop If    '${var}'=='CONTINUE'
        Do Something    ${var}
    END


Convert To Binary Example
    ${result}=    Convert To Binary    10
    Should Be Equal    1010    ${result}

    ${result}=    Convert To Binary    F    base=16    prefix=0b
    Should Be Equal    0b1111    ${result}

    ${result}=    Convert To Binary    -2    prefix=B    length=4
    Should Be Equal    -B0010    ${result}


Convert To Bytes Example
    ${bytes}=    Convert To Bytes    hyv
    Should Be Equal    hyv    hyv

    ${bytes}=    Convert To Bytes    82 70    int
    Should Be Equal    RF    ${bytes}

    ${bytes}=    Convert To Bytes    0b10 0x10    int
    Should Be Equal    \x02\x10    ${bytes}

    ${bytes}=    Convert To Bytes    ff 00 07    hex
    Should Be Equal    \xff\x00\x07    ${bytes}

    ${bytes}=    Convert To Bytes    52462121    hex
    Should Be Equal    RF!!    ${bytes}

    ${bytes}=    Convert To Bytes    0000 1000    bin
    Should Be Equal    \x08    ${bytes}

    ${input}=    Create List    1    2
    ${bytes}=    Convert To Bytes    ${input}    int
    Should Be Equal    \x01\x02\x0c    ${bytes}
    ${bytes}=    Convert To Bytes    ${input}    hex
    Should Be Equal    \x01\x02\x12    ${bytes}


Convert To Hex Example
    ${result}=    Convert To Hex    255
    Should Be Equal    ${result}    FF

    ${result}=    Convert To Hex    -10    prefix=0x    length=2
    Should Be Equal    ${result}    -0x0A

    ${result}=    Convert To Hex    255    prefix=X    lowercase=yes
    Should Be Equal    ${result}    Xff


Convert To Integer Example
    ${result}=    Convert To Integer    100
    Should Be Equal    ${result}    100

    ${result}=    Convert To Integer    FF AA
    Should Be Equal    ${result}    65450

    ${result}=    Convert To Integer    100    8
    Should Be Equal    ${result}    64

    ${result}=    Convert To Integer    -100    2
    Should Be Equal    ${result}    -4

    ${result}=    Convert To Integer    0b100
    Should Be Equal    ${result}    4

    ${result}=    Convert To Integer    -0x100
    Should Be Equal    ${result}    -256


Convert To Number Example
    ${result}=    Convert To Number    42.512
    Should Be Equal    ${result}    42.512

    ${result}=    Convert To Number    42.512    1
    Should Be Equal    ${result}    42.5

    ${result}=    Convert To Number    42.512    0
    Should Be Equal    ${result}    43.0

    ${result}=    Convert To Number    42.512    -1
    Should Be Equal    ${result}    40.0


Convert To Octal Example
    ${result}=    Convert To Octal    10
    Should Be Equal    ${result}    12

    ${result}=    Convert To Octal    -F    base=16    prefix=0
    Should Be Equal    ${result}    -017

    ${result}=    Convert To Octal    16     prefix=oct    length=4
    Should Be Equal    ${result}    oct0020

