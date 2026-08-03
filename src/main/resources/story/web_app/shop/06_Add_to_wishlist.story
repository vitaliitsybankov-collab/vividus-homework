Description: Task 2.6 - Verify an item can be added to the Wishlist
!-- BLOCKED (see meta below): No "Add to wishlist" control could be found anywhere on
!-- the live site (checked both the /desktops category listing and individual product
!-- detail pages). Automating this case may not be possible against the current live instance.
!-- Marked @skip so the suite reports this honestly as excluded rather than silently
!-- passing a meaningless assertion.

Meta:
@skip

Scenario: Verify adding a product to the wishlist
Given I am on page with URL `https://demowebshop.tricentis.com/desktops`
When I click on element located by `xpath()`
Then text `The product has been added to your` exists
When I click on element located by `linkText(Wishlist (1))`
Then number of elements found by `xpath()` is equal to `1`
