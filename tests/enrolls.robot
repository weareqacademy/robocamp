*** Settings ***
Documentation        Suite de testes de matricula de alunos
...                  Administrador uma vez logado consegue matricular alunos na academia

Library            JSONLibrary
Library            DateTime

Resource        ../resources/base.resource

*** Test Cases ***
# Teste do Banco
#     [Tags]        db
    
#     Connect To Postgres
#     Delete Enrrol By Email        falcao@gmail.com
#     Disconnect From Database

Deve matricular um aluno

    # Falcão Não mexer
    # Smart
    # 11/10/2022

    Connect To Postgres
    Delete Enrrol By Email        falcao@gmail.com
    Disconnect From Database

    ${admin}    Create Dictionary
    ...         name=Admin
    ...         email=admin@smartbit.com
    ...         pass=qacademy

    Do Login    ${admin}

    ${student}    Load Json From File
    ...           ${EXECDIR}/resources/fixtures/student.json
    ...           encoding=UTF-8
    
    Log To Console   ${student}[enroll][plan]

    Go To Enrolls
    Go To Enroll Form
    Select Student    Falcão Não mexer
    Select Plan       Smart
    Fill Start Date

    Click                 css=button >> text=Salvar
    Verify Toaster        Matrícula cadastrada com sucesso
