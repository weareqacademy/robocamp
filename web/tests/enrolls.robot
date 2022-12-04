*** Settings ***
Documentation        Suite de testes de matricula de alunos
...                  Administrador uma vez logado consegue matricular alunos na academia

Resource        ../resources/base.resource

*** Test Cases ***
Deve matricular um aluno

    ${admin}    Get Fixture        admin
    ${falcao}   Get Fixture        falcao

    Reset Student           ${falcao}[student][email]

    ${token}      Get Service Token    ${admin}
    POST New Student      ${token}     ${falcao}[student]

    Do Login                ${admin}
    
    Go To Enrolls
    Go To Enroll Form
    Select Student    ${falcao}[student][name]
    Select Plan       ${falcao}[enroll][plan]
    Fill Start Date
    Submmit Enroll Form
    Verify Toaster    Matrícula cadastrada com sucesso
