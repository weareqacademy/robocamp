*** Settings ***
Documentation            Reporesentação do componente de notificação

Library        Browser


*** Keywords ***
Open Notifications
    Click      xpath=(//aside//button)[1]

Notification Should Be
    [Arguments]        ${text}

    ${element}        Set Variable        css=.scrollbar-container p

    Wait For Elements State       ${element}
    ...                           visible
    ...                           timeout=2

    Get Text        ${element}        equal         ${text}      
