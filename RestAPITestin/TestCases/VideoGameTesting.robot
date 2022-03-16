*** Settings ***
Library   RequestsLibrary
Library   Colections


*** Variables ***
${BASE_URL}    http://localhost:8000


*** Test Cases ***
Returns all the video games
    create session    mysession    ${BASE_URL}
    ${RESPONSE}=    get request    mysession    /app/videogames
    log to console    ${RESPONSE.status_code}
    log to console    ${RESPONSE.content}

    ${status_code}=    convert to string    ${RESPONSE.status_code}
    should be equal    ${status_code}    200


