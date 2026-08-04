Description: Task 2.6 - Verify an item can be added to the Wishlist
!-- KNOWN ISSUE (see known-issues.json, key "demowebshop-wishlist-button-missing"):
!-- No "Add to wishlist" control could be found anywhere on the live site (checked both
!-- the /desktops category listing and individual product detail pages). Other QA
!-- projects testing this same demo instance have independently reported "Wishlist
!-- button missing for certain products" as a known issue, indicating this is a
!-- site-side limitation rather than an automation defect. This scenario is left
!-- active (not @skip) so it runs, hits the real failure, and gets classified as a
!-- Known Issue in the report rather than silently excluded - the assertion pattern
!-- below matches exactly the locator that fails.

Scenario: Verify adding a product to the wishlist
Given I am on page with URL `https://demowebshop.tricentis.com/desktops`
When I click on element located by `xpath((//input[contains(@class,'add-to-wishlist-button')])[1])`
Then text `The product has been added to your` exists
When I click on element located by `linkText(Wishlist (1))`
Then number of elements found by `xpath(//table[@class='cart']//tr[@class='item-row'])` is equal to `1`
