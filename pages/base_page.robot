*** Settings ***
Library    SeleniumLibrary    screenshot_root_directory=results
Library    DateTime
Resource    login_page.robot
Resource    products_list_page.robot
Resource    product_page.robot
Resource    inventory_page.robot

*** Variables ***
${timeout}      5000ms
${url}          https://www.saucedemo.com/
${browser}      Chrome

*** Keywords ***
Abrir Navegador
    Register Keyword To Run On Failure    Tirar Screenshot
    Open Browser    url=${url}    browser=${browser}
    Maximize Browser Window
    Set Browser Implicit Wait    10000ms
    Wait Until Element Is Visible    css=.login_logo    ${timeout}

Fechar Navegador
    Sleep    3 seconds
    Close Browser

Tirar Screenshot
    ${date} =    Get Current Date
    ${date} =    Convert Date    ${date}    result_format=%Y.%m.%d_%H.%M.%S
    Capture Page Screenshot    ${TEST_NAME}/${date}-${TEST_NAME}.png

Clicar no Carrinho
    Click Element    css=[data-test="shopping-cart-link"]
    Wait Until Element Contains    css=[data-test="title"]    Your Cart    ${timeout}

Realizar Logout
    Click Element    id=react-burger-menu-btn
    Click Element    id=logout_sidebar_link
    Wait Until Element Is Visible    css=.login_logo    5000ms