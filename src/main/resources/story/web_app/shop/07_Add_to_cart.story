Description: Task 2.7 - Verify an item can be added to the cart
!-- The first product ("Build your own computer") is configurable, so clicking its
!-- listing-page "Add to cart" button redirects to the product detail page instead of
!-- adding directly - that's real site behavior, not a bug. This story follows that
!-- actual flow: open the product detail page first, then add to cart from there.
!-- NOTE: the product-title link locator is a best-effort guess at the item-box's
!-- internal structure and may need adjustment.

Scenario: Verify adding a product to the cart
Given I am on page with URL `https://demowebshop.tricentis.com/desktops`
When I click on element located by `xpath((//div[contains(@class,'item-box')]//a[.//img])[1])`
When I click on element located by `xpath(//input[contains(@class,'button-1') and contains(@class,'add-to-cart-button')])`
When I wait until element located by `id(topcartlink)` contains text `1`
When I click on element located by `id(topcartlink)`
Then number of elements found by `xpath(//table[@class='cart']//tr[@class='cart-item-row'])` is greater than or equal to `1`
