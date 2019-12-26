*** Settings ***
Documentation    Suite 1 Ejemplo
Library          SeleniumLibrary
#Library          OperatingSystem
#Library          Screenshot screenshot_module=PIL
Library                ScreenCapLibrary
Library                OperatingSystem

*** Variables ***
${LOGIN URL}      https://www.google.com/
${BROWSER}        Chrome
${TEXTO_BUSCAR}   Robot Framework
${TEXTO_BUSCAR_2}   Robot Framework Selenium

*** Test Cases ***
TestCase01
    Open Browser To Google
    Input Search        ${TEXTO_BUSCAR}
    Sleep               3s
    Take Screenshot     name=search  format=png  quality=0
    Press Keys          None    ENTER
    Sleep               3s
    Take Screenshot     name=result  format=png  quality=0
    [Teardown]          Close Browser

TestCase02
    ${chrome_options} =     Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}   add_argument    headless
    Call Method    ${chrome_options}   add_argument    disable-gpu
    ${options}=     Call Method     ${chrome_options}    to_capabilities

    Open Browser    ${LOGIN URL}    browser=chrome       desired_capabilities=${options}
    Input Search        ${TEXTO_BUSCAR_2}
    Sleep               3s
#    Take Screenshot     name=search2  format=png  quality=0
    Press Keys          None    ENTER
    Sleep               3s
#    Take Screenshot     name=result2  format=png  quality=0
    [Teardown]          Close Browser

TestCase03
    Open Browser To Google
    Input Search        ${TEXTO_BUSCAR_2}
    Sleep               3s
#    Take Screenshot     name=search3  format=png  quality=0
    Press Keys          None    ENTER
    Sleep               3s
#    Take Screenshot     name=result3  format=png  quality=0
    [Teardown]          Close Browser

*** Keywords ***
Open Browser To Google
    Open Browser        ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Title Should Be     Google

Input Search
    [Arguments]         ${search}
    Input Text    //input[@name='q']    ${search}
