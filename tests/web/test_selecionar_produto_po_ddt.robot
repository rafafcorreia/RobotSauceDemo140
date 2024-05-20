*** Settings ***
Resource    ../../pages/base_page.robot

Test Setup    base_page.Abrir Navegador
Test Teardown    base_page.Fechar Navegador
Test Template    Selecionar Produto

*** Test Cases ***
TC001    Sauce Labs Backpack    $29.99
TC002    Sauce Labs Bike Light    $9.99    
TC003    Sauce Labs Bolt T-Shirt    $15.99
TC004    Sauce Labs Fleece Jacket    $49.99
TC005    Sauce Labs Onesie    $7.99
TC006    Test.allTheThings() T-Shirt (Red)    $15.99

*** Keywords ***
Selecionar Produto
    [Arguments]    ${product_name}    ${product_price}
    Preencher Campo Usuário    standard_user
    Preencher Campo Senha    secret_sauce
    Clicar no Botão Login
    Element Text Should Be    ${products_list_page_header}    Products
    Clicar no Produto    ${product_name}
    Element Text Should Be    ${product_page_product_name}    ${product_name}
    Element Text Should Be    ${product_page_product_price}    ${product_price}
    Clicar no Botão "Add to cart"
    Clicar no Carrinho
    Element Text Should Be    ${inventory_page_product_name}    ${product_name}
    Element Text Should Be    ${inventory_page_product_price}    ${product_price}
    Realizar Logout
    Tirar Screenshot de Sucesso    Realizar Logout