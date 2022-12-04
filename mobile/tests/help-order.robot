*** Settings ***
Documentation            Suite de testes de pedido de ajuda

Resource    ../resources/base.resource

Library         DateTime

# Test Setup       Start App
# Test Teardown    Finish App

# {"start_date":"2022-04-12T03:00:00.000Z","plan_id":1,"student_id":7}

*** Test Cases ***
Deve poder solicitar ajuda

    ${admin}     Get Fixture    admin
    ${papito}    Get Fixture    papito

    Reset Student       ${papito}[student][email]

    ${token}            Get Service Token        ${admin}
    POST New Student    ${token}                 ${papito}[student]



