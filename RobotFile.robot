*** Settings ***
Library  CustomLib.py
Library  OperatingSystem
Library  SeleniumLibrary

*** Comments ***
There is no real purpose for this script other than getting to know the Robot Framework.

*** Variables ***
${path}             C:/Users/alvarados/Desktop/RobotTestFiles
${file}             /Example.txt

${LOGIN URL}        http://linpubx105.gl.avaya.com:30600/auth/realms/master/protocol/openid-connect/auth?client_id=security-admin-console&redirect_uri=http%3A%2F%2Flinpubx105.gl.avaya.com%3A30600%2Fauth%2Fadmin%2Fmaster%2Fconsole%2F&state=33807332-9bf1-46e2-80c6-24279bd515f9&response_mode=fragment&response_type=code&scope=openid&nonce=d09cd4ca-64c5-4c0b-83f4-66fb60a95da0
${BROWSER}          Chrome

*** Test Cases ***
Custom library example
    Hello world
Example
    Make a dir
    Make a file
    Check if flie was created correctly

Valid Login
    Open Browser To Login Page
    Send login credentials
    Should return an error


*** Keywords ***
Open Browser To Login Page
    Open Browser                ${LOGIN URL}        ${BROWSER}
    Title should be             Scripps
    sleep                       2s
Send login credentials
    Input text                  username            Username
    Input text                  password            Password
    Click Button                login
Should return an error
    Element Text Should Be      class:kc-feedback-text    errorInvalid username or password.


Make a dir
    create directory            ${path}
Make a file
    create file                ${path}${file}      Hello! This text was written by a bot!
Check if flie was created correctly
    file should exist          ${path}${file}
    file should not be empty   ${path}${file}


