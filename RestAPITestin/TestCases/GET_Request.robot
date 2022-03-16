*** Settings ***
Library     RequestsLibrary

*** Variables ***
${BASE_URL}    http://restapi.demoqa.com
${CITY}    Delhi

*** Test Cases ***
Get weather info
    create session    mysession    ${BASE_URL}
    ${RESPONSE}=    get request    mysession    /utilities/weather/city/${CITY}

    log to concole    ${RESPONSE.status_code}
    log to concole    ${RESPONSE.content}
    log to concole    ${RESPONSE.headers}

