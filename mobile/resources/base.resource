*** Settings ***
Documentation        Arquivo principal

Library     AppiumLibrary
Library     JSONLibrary

Resource    screens/login.resource
Resource    screens/help.resource
Resource    screens/components/popup.resource
Resource    screens/components/footer.resource

Resource    services/sessions.resource
Resource    services/students.resource
Resource    services/enrolls.resource

Resource    database.resource

*** Keywords ***
Start App
    Open Application	http://localhost:4723/wd/hub
    ...                 alias=Smartbit
    ...                 automationName=UiAutomator2
    ...                 platformName=Android
    ...                 deviceName=Android Simulator
    ...                 app=${EXECDIR}/app/smartbit-beta.apk
    ...                 udid=emulator-5554
    ...                 autoGrantPermissions=true

    Wait Until Page Contains        Informe seu código de acesso

Finish App
    Capture Page Screenshot
    Close Application

# Helpers
Get Fixture
    [Arguments]        ${fixture_file}

    ${fixture}        Load JSON From File
    ...               ${EXECDIR}/resources/fixtures/${fixture_file}.json
    ...               encoding=UTF-8

    [return]          ${fixture}
