*** Settings ***
Resource    ../../../pages/base_page.robot
Suite Setup    Definir Horario
Test Setup    base_page.Abrir Navegador
Test Teardown    base_page.Fechar Navegador