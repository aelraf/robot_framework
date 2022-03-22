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

    





