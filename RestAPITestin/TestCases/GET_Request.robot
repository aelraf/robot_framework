*** Settings ***
Library     RequestsLibrary
Library     Collections

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

    # walidujemy poprawność kodu odpowiedzi
    ${STATUS_CODE}=    convert to string    ${RESPONSE.status_code}
    should be equal    ${STATUS_CODE}   200


    ${BODY}=    convert to string    ${RESPONSE.content}
    should contain    ${BODY}   Delhi


    ${content_type_value}=   get from dictionary    ${RESPONSE.headers}    Content-Type
    should be equal    ${content_type_value}    application/json

