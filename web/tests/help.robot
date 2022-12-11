*** Settings ***
Documentation            Suite de testes de recebimento de pedido de ajuda

Resource        ../resources/base.resource

Library        Browser

*** Test Cases ***
Deve receber uma notificação de pedido de ajuda

    # 1a Pessoa => Admin
    # 3a Pessoa => Aluno (João)

    # Dado que tenho um aluno cadastrado
    
    ${admin}   Get Fixture    admin
    ${joao}    Get Fixture    joao

    Reset Student           ${joao}[student][email]
    
    ${token}          Get Service Token      ${admin}
    ${student_id}     POST New Student       ${token}     ${joao}[student]


    # Quando esse aluno (João) envia um pedido de ajuda via mobile

    POST Question        ${student_id}    ${joao}[question]

    # Então devo ver uma notificação no painel do administrador
    
    Do Login    ${admin}

    Click      xpath=(//aside//button)[1]

    Wait For Elements State       css=.scrollbar-container p
    ...                           visible
    ...                           timeout=2

    Get Text        css=.scrollbar-container p        equal         ${joao}[question]      

    Sleep    	    10