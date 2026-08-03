Description: Task 2.8 - Verify an item can be removed from the cart

Scenario: Verify removing a product from the cart
Given I am on page with URL `https://demowebshop.tricentis.com/desktops`
When I click on element located by `xpath((//div[contains(@class,'item-box')]//a[.//img])[1])`
When I click on element located by `xpath(//input[contains(@class,'button-1') and contains(@class,'add-to-cart-button')])`
When I wait until element located by `id(topcartlink)` contains text `1`
When I click on element located by `id(topcartlink)`
Then number of elements found by `xpath(//table[@class='cart']//tr[@class='cart-item-row'])` is greater than or equal to `1`
When I click on element located by `xpath(//tr[@class='cart-item-row']//input[contains(@name,'removefromcart')])`
When I click on element located by `xpath(//input[contains(@name,'updatecart')])`
Then number of elements found by `xpath(//table[@class='cart']//tr[@class='cart-item-row'])` is equal to `0`
