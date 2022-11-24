*** Settings ***
Documentation        Suite de testes de matricula de alunos
...                  Administrador uma vez logado consegue matricular alunos na academia

Resource        ../resources/base.resource

*** Test Cases ***
APi Test
    [Tags]        api

    ${admin}    Get Fixture        admin
    ${falcao}  Get Fixture        falcao

    Reset Student Enroll    ${falcao}[student][email]    

    Set Token        ${admin}
    POST Student     ${falcao}[student]

Deve matricular um aluno

    ${admin}    Get Fixture        admin
    ${student}  Get Fixture        student

    Reset Student Enroll    ${student}[email]    
    Do Login                ${admin}
    
    Go To Enrolls
    Go To Enroll Form
    Select Student    ${student}[name]
    Select Plan       ${student}[enroll][plan]
    Fill Start Date
    Submmit Enroll Form
    Verify Toaster    Matrícula cadastrada com sucesso
