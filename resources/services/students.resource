*** Settings ***
Documentation        Consumindo o endpoint de cadastro de alunos

Library        RequestsLibrary


*** Keywords ***
Set Token
    [Arguments]       ${user}

    # ${admin}    Get Fixture        admin

    ${response}     POST                    http://localhost:3333/sessions
    ...             json=${user}
    ...             expected_status=any

    # ${TOKEN}        Set Variable        Bearer ${response.json()}[token]

    Set Suite Variable    	  ${TOKEN}        Bearer ${response.json()}[token]
    
    # ${result}      Set Variable    ${EMPTY}

    # IF  "200" in "${response}"
    #     ${result}    Set Variable              Bearer ${response.json()}[token]
    # END

    # [return]    ${result}


POST Student
    [Arguments]        ${student}

    ${headers}      Create Dictionary       Authorization=${TOKEN}
    
    POST        http://localhost:3333/students
    ...         json=${student}
    ...         headers=${headers}
    ...         expected_status=any