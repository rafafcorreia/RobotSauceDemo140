*** Settings ***
Resource    ../../pages/base_page.robot

Test Setup    base_page.Abrir Navegador
Test Teardown    base_page.Fechar Navegador

*** Test Cases ***
Selecionar Sauce Labs Backpack
    Preencher Campo Usuário    standard_user
    Preencher Campo Senha    secret_sauce
    Clicar no Botão Login
    Element Text Should Be    ${products_list_page_header}    Products
    Clicar no Produto    Sauce Labs Backpack
    Element Text Should Be    ${product_page_product_name}    Sauce Labs Backpack
    Element Text Should Be    ${product_page_product_price}    $29.99
    Clicar no Botão "Add to cart"
    Clicar no Carrinho
    Element Text Should Be    ${inventory_page_product_name}    Sauce Labs Backpack
    Element Text Should Be    ${inventory_page_product_price}    $29.99
    Realizar Logout
    Tirar Screenshot de Sucesso    Realizar Logout
    