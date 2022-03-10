*** Settings ***
Library    Libraries/SecondTestClass.py
Library    Libraries/FirstTestClass.py  WITH NAME  first
Library    Libraries/FirstTestClass.py  WITH NAME  first_again

*** Test Cases ***
Check creation
    log to console   I'm here!


Check first libraries
    log to console  ${\n}FIRST CHANGE:
    first.change_value  FIRST!!!

    log to console  ${\n}FIRST CHANGE FOR SECOND FIRST:
    first_again.change_value  FIRST AGAIN!!!

    log to console  ${\n}SECOND CHANGE FOR FIRST ONE:
    first.change_value  not again...


Check libraries order
    change value  FIRST!!!


# ustawiamy kolejność, w jakiej ma Robot Framework wyszukiwać
How to get value
    log to console  ${EMPTY}
    ${FIRST_INSTANCE}  get library instance  first
    ${FIRST_AGAIN_INSTANCE}  get library instance  first_again
    set library search order  first  first_again  Libraries/SecondTestClass.py
    change value  FIRST!!!
    log to console  Checking values:
    log to console  ${FIRST_INSTANCE.value}
    log to console  ${FIRST_AGAIN_INSTANCE.value}
    ${VALUE}  get value
    log to console  ${VALUE}


# poniższy test nie zadziała
This will not work
    set library search order  first first_again  Libraries/SecondTestClass.py
    log to console  ${EMPTY}
    first_again.value  FIRST!!!


# poniższy także nie zadziała
This will also not work
    log to console  ${EMPTY}
    ${FIRST_INSTANCE}  get library instance  first
    ${FIRST_INSTANCE.value}  FIRST!!!
    log to console  ${FIRST_INSTANCE.value}
