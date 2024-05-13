*** Settings ***
Library    SeleniumLibrary

Test Teardown    Close Browser

*** Variables ***
${url}    https://www.saucedemo.com/
${browser}    Chrome

*** Test Cases ***
Selecionar Sauce Labs Backpack
    Dado que acesso o site SauceDemo
    Quando preencho o campo usuario    standard_user
    E preencho o campo senha    secret_sauce
    E clico no botão Login
    Então sou direcionado para a pagina de produtos
    Quando clico no produto    Sauce Labs Backpack    $29.99
    Então sou direcionado para a pagina do produto    
    Quando clico em adicionar para o carrinho
    E clico no ícone do carrinho
    Então sou direcionado para o carrinho
    Quando clico no menu
    E clico em Logout
    Então sou direcionado para a página de login

*** Keywords ***
Dado que acesso o site SauceDemo
    Open Browser    url=${url}    browser=${browser}
    Maximize Browser Window
    Set Browser Implicit Wait    10000ms
    Wait Until Element Is Visible    css=.login_logo    5000ms

Quando preencho o campo usuario
    [Arguments]    ${username}
    Input Text    css=[data-test="username"]    ${username}

E preencho o campo senha
    [Arguments]    ${password}
    Input Text    css=[data-test="password"]    ${password}

E clico no botão Login
    Click Button    css=[data-test="login-button"]

Então sou direcionado para a pagina de produtos
    Element Text Should Be    css=[data-test="title"]    Products

Quando clico no produto
    [Arguments]    ${product_name}    ${product_price}
    Set Test Variable    ${test_product_name}    ${product_name}
    Set Test Variable    ${test_product_price}    ${product_price}
    Click Element    css=img[alt="${test_product_name}"]

Então sou direcionado para a pagina do produto
    Element Text Should Be    css=[data-test="inventory-item-name"]    ${test_product_name}
    Element Text Should Be    css=[data-test="inventory-item-price"]    ${test_product_price}

Quando clico em adicionar para o carrinho
    Click Element    css=[data-test="add-to-cart"]
    Element Text Should Be    css=[data-test="shopping-cart-badge"]    1

E clico no ícone do carrinho
    Click Element    css=[data-test="shopping-cart-link"]

Então sou direcionado para o carrinho
    Wait Until Element Contains    css=[data-test="title"]    Your Cart    5000ms
    Element Text Should Be    css=[data-test="inventory-item-name"]    ${test_product_name}
    Element Text Should Be    css=[data-test="inventory-item-price"]    ${test_product_price}

Quando clico no menu
    Click Element    id=react-burger-menu-btn

E clico em Logout
    Click Element    id=logout_sidebar_link

Então sou direcionado para a página de login
    Wait Until Element Is Visible    css=.login_logo    5000ms
    