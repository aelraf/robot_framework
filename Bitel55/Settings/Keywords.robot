*** Settings ***
Resource  Settings/Settings.robot


*** Keywords ***
User has accessed the website
    Open browser    ${BACKOFFICE_FRONTEND_URL}    ${BROWSER}    executable_path=${DRIVER_EXECUTABLE}
    wait until element is visible  ${LOGO_XPATH}


# sposób na podanie zmiennej do słowa kluczowego - zmienna globalna
User clicked search button
    click element    ${SEARCH_XPATH}
    wait until element is visible    ${SEARCH_INPUT}


# drugi sposób podania zmiennej do słowa kluczowego - jako część słowa kluczowego
User write ${VALUE} into search
    input text    ${SEARCH_INPUT}    ${VALUE}


# podając zmienną na końcu, używamy taga [Arguments], po nim wszystkie argumenty wymagane, dowolną ilość
Search value should be
    [Arguments]    ${VALUE}
    ${TEXT}    get value    ${SEARCH_INPUT}
    should be equal as string    ${TEXT}    ${VALUE}


There should be ${VALUE} in search field
    ${TEXT}  get value  ${EARCH_INPUT}
    should be equal as string  ${TEXT}  ${VALUE}