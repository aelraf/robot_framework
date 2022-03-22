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


Zmienne specjalne
    # to bezwzględna ścieżka do katalogu, w którym zlokalizowany jest test
    Log    ${CURDIR}    
    # bezwzględna ścieżka do systemowego katalogu tymczasowego 
    Log    ${TEMPDIR}
    # bezwzględna ścieżka do katalogu, z którego rozpoczęto wykonywanie testów
    Log    ${EXECDIR}
    # separator ścieżki, w linuxie /, w Windowsie \
    Log    ${/}
    # separator ścieżek, w linuxie :, w Windowsie ;
    Log    ${:}
    # znak nowej linii, w linuxie \n, w windowsie \r\n
    Log    ${\n}


Operacje na kolekcjach
    # zwraca liczbę elementów w kolekcji
    Get Length
    # dodaje elementy do listy
    Append To List
    # usuwa element o podanym indeksie z listy
    Remove From List
    # usuwa element o podanym kluczu ze słownika
    Remove From Dictionary
    # sortuje listę w miejscu
    Sort List


Funkcje (Keywordy) ktore moga przerwac wykonywanie testu
    # założenie co do liczby elementów
    Length Should Be
    # założenie co do pustej kolekcji
    Should Be Empty
    # założenie co do niepustej kolekcji
    Should Not Be Empty
    # założenie co do elementu znajdującego się w kolekcji
    Should Contain
    # założenie co do braku elementu w kolekcji
    Should Not COntain

    # operacje te są dostępne tutaj
    # http://robotframework.org/robotframework/3.1/libraries/BuiltIn.html


Tworzenie zmiennych w tescie
    # tworzy zmienną w ciele testu lub keywordu
    Set Variable
    # tworzy listę w ciele testu lub keywordu
    Create List
    # tworzy słownik w ciele testu lub keywordu
    Create Dictionary

    # biblioteka Collections
    # http://robotframework.org/robotframework/3.1/libraries/Collections.html


# zmienne można modyfikować i tworzyć w teście lub keywordzie za pomocą odpowiednich keywordów
Variable In Keyword
    ${new_name}=    Set Variable    Janusz
    ${new_list}=    Create List    Janusz
    ...    Alicja    Natalia
    ${new_dict}=    Create Dictionary
    ...    name=Anna    lastname=Nowak

    Length Should Be    ${new_list}    3

    Log    Variable new_name: ${new_name}
    Log    Variable new_dict: ${new_list}
    Log    Variable new_dict: ${new_dict}


# w bibliotece BuiltIn mamy najczęściej używane operacje
# http://robotframework.org/robotframework/3.1/libraries/BuiltIn.html
Najczesciej Uzywane Keywordy
    # sprawdzamy, czy podany warunek jest prawdą
    Should Be True
    # sprawdzamy, czy podane dwie wartości są równe
    Should Be Equal
    # porównywanie zmiennych jako napisy
    Should Be Equal As String
    # porównywanie zmiennych jako liczby całkowite
    Should Be Equal As Integers
    # łączenie napisów
    Catenate
    # uruchamianie podanego wyrażenia w Pythonie
    Evaluate
    # wykonuje tylko jeśli warunek jest spełniony
    Run Keyword If



