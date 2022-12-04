*** Settings ***
Documentation        Consumindo a rota enrollments da APi REST

Library        RequestsLibrary

*** Keywords ***
POST New Enroll
    [Arguments]        ${token}        ${enroll}

    ${headers}     Create Dictionary        Authorization=${token}
    
    ${response}    POST        http://localhost:3333/enrollments
    ...                        json=${enroll}
    ...                        headers=${headers}
    ...                        expected_status=201
