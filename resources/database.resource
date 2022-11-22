*** Settings ***
Documentation       Database Helpers
Library             DatabaseLibrary

*** Keywords ***
Connect To Postgres
    Connect To Database    psycopg2
    ...    kocprwov
    ...    kocprwov
    ...    5Imw_Pe8vY0q909vdQlZKzedEnrE0wyo
    ...    babar.db.elephantsql.com
    ...    5432

Select Student Where Email
    [Arguments]    ${email}

    ${query}    Set Variable
    ...    SELECT * FROM public.students WHERE email = '${email}';

    ${result}     Query    ${query}

    # Log To Console    ${result}[0][1]
    [return]     ${result}[0]

Delete Enrrol By Email
    [Arguments]        ${email}
    
    ${user}    Select Student Where Email    ${email}

    ${query}    Set Variable
    ...    DELETE FROM public.enrollments WHERE student_id = '${user}[0]';

    # LOG To COnsole    ${query}

    Execute SQL String      ${query}  

    # Log To Console    ${result}


    
