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
