*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${campo_usuario}    css=[data-test="username"]
${campo_senha}    css=[data-test="password"]
${btn_login}    css=[data-test="login-button"]

*** Keywords ***
Preencher Campo Usuário
    [Arguments]    ${usuario}
    Input Text    ${campo_usuario}    ${usuario}

Preencher Campo Senha
    [Arguments]    ${senha}
    Input Text    ${campo_senha}    ${senha}

Clicar no Botão Login
    Click Button    ${btn_login}
