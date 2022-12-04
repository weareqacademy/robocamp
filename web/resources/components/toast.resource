*** Settings ***
Documentation            Reporesentação do componente toast

Library        Browser


*** Keywords ***
Verify Toaster
    [Arguments]        ${expected_message}

    Wait For Elements State
    ...    css=.Toastify__toast-body div >> text=${expected_message}
    ...    visible    5


    Wait For Elements State
    ...    css=.Toastify__toast-body div
    ...    detached    10