*** Settings ***
Library   RequestsLibrary
Library   Colections


*** Variables ***
${BASE_URL}    http://localhost:8000


*** Test Cases ***
Returns all the video games (GET)
    create session    mysession    ${BASE_URL}
    ${RESPONSE}=    get request    mysession    /app/videogames
    log to console    ${RESPONSE.status_code}
    log to console    ${RESPONSE.content}

    ${status_code}=    convert to string    ${RESPONSE.status_code}
    should be equal    ${status_code}    200


Add a new video game (POST)
    create session    mysession    ${BASE_URL}
    ${BODY}=    create dictionary    id=100  name=Spider-Man  reviewScore=5
    ${HEADER}=    create dictionary    Content-Type=application/json
    ${RESPONSE}=    post request    mysession   /app/videogames    data=${BODY}    headers=${HEADER}

    log to console    ${RESPONSE.status_code}
    log to console    ${RESPONSE.content}

    # sprawdzamy poprawność
    ${status_code}=    convert to string    ${RESPONSE.status_code}
    should be equal    ${status_code}    200

    ${RES_BODY}=    convert to string    ${RESPONSE.content}
    should contain    ${RES_BODY}    Record Added Successfully


Return the detail of a single game by ID (GET)
    create session    mysession    ${BASE_URL}
    ${RESPONSE}=    get request    mysession    /app/videogames/100
    log to console    ${RESPONSE.status_code}
    log to console    ${RESPONSE.content}

    # sprawdzamy poprawność
    ${STATUS_CODE}=    convert to string    ${RESPONSE.status_code}
    should be equal    ${STATUS_CODE}    200

    ${RES_BODY}=    convert to string    ${RESPONSE.content}
    should contain    ${RES_BODY}    Spider-Man


Update an existing video game by specifying anew body (PUT)
    create session    mysession    ${BASE_URL}
    ${BODY}=    create dictionary    id=100  name=Spider-Man  reviewScore=10
    ${HEADER}=    create dictionary    Content-Type=application/json
    ${RESPONSE}=    post request    mysession    /app/videogames  data=${BODY}  headers=${HEADER}

    log to console    ${RESPONSE.status_code}
    log to console    ${RESPONSE.content}

    # sprawdzanie poprawności
    ${STATUS_CODE}=    convert to string    ${RESPONSE.status_code}
    should be equal    ${STATUC_CODE}    200

    ${RES_BODY}=    convert to string    ${RESPONSE.content}
    should contain    ${RES_BODY}    Record Added Successfully
