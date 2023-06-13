*** Settings ***
Resource          ../utils/customEvidenceGenerators.robot
Test Setup        Abrir navegador
Test Teardown     Fechar navegador

*** Variables ***
${BROWSER}    Firefox
${HOME_URL_MOBLY}             https://www.mobly.com.br
${HOME_URL_MAGALU}            https://www.magazineluiza.com.br/
${HOME_URL_AMERICANAS}        https://www.americanas.com.br/

*** Keywords ***
#### Setup e Teardown
Abrir navegador
    Generate test evidence video  #chama a KeyWord que Inicia a gravaçao do video ao abrir o navegador
    Open Browser  about:blank  ${BROWSER}
    maximize Browser Window
 
Fechar navegador
    Close Browser
    Stop and save evidence video  #chama a KeyWord que Finaliza a gravaçao do video ao fechar o navegador

*** Test Cases ***

CT01 - acessar site da mobly
    Go To    ${HOME_URL_MOBLY}  #direcviona para a url desejada do site a ser feito o print
    Sleep    10  #usando o sleep apenas para manter a pagina aberta
    Generate test evidence screenshot  #chama a KeyWord que captura print da tela

CT02 - acessar site da Magalu
    Go To   ${HOME_URL_MAGALU}  #direcviona para a url desejada do site a ser feito o print
    Sleep    10  #usando o sleep apenas para manter a pagina aberta
    Generate test evidence screenshot  #chama a KeyWord que captura print da tela

CT01 - acessar site da Americanas
    Go To    ${HOME_URL_AMERICANAS}  #direcviona para a url desejada do site a ser feito o print
    Sleep    10  #usando o sleep apenas para manter a pagina aberta
    Generate test evidence screenshot  #chama a KeyWord que captura print da tela