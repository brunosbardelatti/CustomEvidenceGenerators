*** Settings ***
Library            OperatingSystem
Library            String
Library            SeleniumLibrary
Library            DateTime
Library            ScreenCapLibrary
Library            AllureLibrary 

*** Variables ***
${INVALID_CHARS}           .:\/()
${DATE_FORMAT}  %d-%m-%Y_%H%M%S 

*** Keywords ***
Get Suite Name
    ${suite_name}           Get Variable Value    ${SUITE NAME}
    ${suite_name}           Replace Invalid Chars    ${suite_name}
    [Return]                ${suite_name}

Get Test Name
    ${test_name}            Get Variable Value    ${TEST NAME}
    ${test_name}            Replace Invalid Chars    ${test_name}
    [Return]                ${test_name}

Replace Invalid Chars
    [Arguments]             ${string_to_replace}
    ${string_replaced}      Replace String    ${string_to_replace}    ${INVALID_CHARS}    _
    [Return]                ${string_replaced}

Generate test evidence video
    ${suite_name}           Get Suite Name
    ${test_name}            Get Test Name
    ${directory}=    Set Variable    reports/${suite_name}/${test_name}/video
    Create Directory    ${directory}
    ScreenCapLibrary.Set Screenshot Directory    ${directory}
    ${video_name}=  Set Variable  ${test_name}.webm
    Start Video Recording  name=${video_name}

Generate test evidence screenshot
    ${suite_name}           Get Suite Name
    ${test_name}            Get Test Name
    SeleniumLibrary.Set Screenshot Directory    reports/${suite_name}/${test_name}/imagens
    ${timestamp}=  Get Current Date  result_format=${DATE_FORMAT}
    ${screenshot_name}=  Set Variable  ${test_name}_${timestamp}.png
    Capture Page Screenshot  ${screenshot_name}
    Attach File     reports/${suite_name}/${test_name}/imagens/${screenshot_name}

Stop and save evidence video
    Run Keyword And Ignore Error  Stop Video Recording
    Attach File    reports/${suite_name}/${test_name}/video/${test_name}.webm