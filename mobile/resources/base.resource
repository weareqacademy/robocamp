*** Settings ***
Documentation        Arquivo principal

Library    AppiumLibrary

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