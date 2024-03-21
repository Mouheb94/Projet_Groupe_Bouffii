*** Settings ***
Library  SeleniumLibrary
*** Variables ***

*** Keywords ***
navigate
    open browser   https://magento.softwaretestingboard.com/   chrome
*** Test Cases ***
Create an Account
     navigate
     click element     //html/body/div[2]/header/div[1]/div/ul/li[3]/a
 # ou avec xpath:/html/body/div[2]/header/div[1]/div/ul/li[3]/
    input text  id:firstname    Assoma
    input text  id:lastname    Quesson
    input text  id:email_address   Assoma.Quesson@gmail.com
    input text  id:password  Test5.Test5
    input text  id:password-confirmation   Test5.Test5
    click button    //*[@id="form-validate"]/div/div[1]/button
    sleep     1
    Page Should Contain     Thank you for registering with Main Website Store.
     sleep     3
     Location should contain    /customer/account/
     page should contain    My Account
     ${nomprenom}=  get text    //*[@id="maincontent"]/div[2]/div[1]/div[4]/div[2]/div/div[1]/p
     should be equal    ${nomprenom}    Assoma Quesson\nAssoma.Quesson@gmail.com
#element text should be     //*[@id="maincontent"]/div[2]/div[1]/div[4]/div[2]/div/div[1]/p  test5 test5\ntest5.test7@gmail.com
#element should conatin     //*[@id="maincontent"]/div[2]/div[1]/div[4]/div[2]/div/div[1]/p  test5 test5\ntest5.test7@gmail.com
Sign In
    [tags]  signin
    navigate
    click element   //html/body/div[2]/header/div[1]/div/ul/li[2]/a
    input text  id:email    Assoma.Quesson@gmail.com
    input text  id:pass     Test5.Test5
    click button    id:send2
    click element   id:ui-id-8
    click element   //*[@id="maincontent"]/div[4]/div[2]/div/div/ul[3]/li[1]/a
    click element   //*[@id="maincontent"]/div[3]/div[1]/div[4]/ol/li[7]/div/a/span/span/img
    click button    id:product-addtocart-button
    element should be visible   You added Voyage Yoga Bag to your shopping cart.
    click element   /html/body/div[2]/header/div[2]/div[1]/a
    click button    data:action:close