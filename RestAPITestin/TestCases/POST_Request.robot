*** Settings ***
Library    requestsLibrary
Library    Collecions

*** Variables ***
${BASE_URL}=    http://restapi.demoqua.com/customer

*** Test Cases ***
Put customer registration
    create session    mysession    ${BASE_URL}
    ${BODY}=    create dictionary    FirstName=Jan123  LastName=Jan123  UserName=Jan123  Password=Jan123  Email=Jan123
    ${HEADER}=    create dictionary    Content-Type=application/json

    ${RESPONSE}=    post request    mysession    /register    data=${BODY}

    log to console    ${RESPONSE.status_code}
    log to console    ${RESPONSE.content}

    # walidacja
    ${STATUS_CODE}=    convert to string    ${RESPONSE.status_code}
    should be equal    ${STATUS_CODE}    200

    ${RES_BODY}=   convert to string    ${RESPONSE.content}
    should contain    ${RES_BODY}    OPERAION_SUCCESS
    should contain    ${RES_BODY}    Operation completed successfully
