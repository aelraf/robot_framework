*** Settings ***
Library    my_math.py

*** Test Cases ***
Custom Library Test
    ${sum}=    My Sum    4    2
    Log    Sum: ${sum}

# spacje w nazwie keywordu są tłumaczone na znaki podłogi (_) w nazwie funkcji
# argumenty przekazywane są jako napisy, dlatego należy jawnie zamienić je na liczby
# czy - szerzej - na pożądany typ danych