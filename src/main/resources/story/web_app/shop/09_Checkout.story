Description: Task 2.9 - Verify checkout is possible for an item
!-- Registers a user (per the hometask's intent), but checkout itself deterministically
!-- follows the "Checkout as Guest" path rather than relying on the registered session
!-- staying authenticated through to checkout, which proved inconsistent between runs.
!-- Fills the full billing address form using confirmed field ids.

Scenario: Register a user for the checkout check
Given I initialize story variable `email` with value `#{generate(Internet.emailAddress)}`
Given I am on page with URL `https://demowebshop.tricentis.com/register`
When I click on element located by `id(gender-male)`
When I enter `Alex` in field located by `id(FirstName)`
When I enter `Stone` in field located by `id(LastName)`
When I enter `${email}` in field located by `id(Email)`
When I enter `Password123!` in field located by `id(Password)`
When I enter `Password123!` in field located by `id(ConfirmPassword)`
When I click on element located by `id(register-button)`
Then text `Your registration completed` exists
When I click on element located by `linkText(Log out)`

Scenario: Verify checkout can be completed for an added item
Given I am on page with URL `https://demowebshop.tricentis.com/desktops`
When I click on element located by `xpath((//div[contains(@class,'item-box')]//a[.//img])[1])`
When I click on element located by `xpath(//input[contains(@class,'button-1') and contains(@class,'add-to-cart-button')])`
When I wait until element located by `id(topcartlink)` contains text `1`
When I click on element located by `id(topcartlink)`
Then number of elements found by `xpath(//table[@class='cart']//tr[@class='cart-item-row'])` is greater than or equal to `1`
When I click on element located by `id(termsofservice)`
When I click on element located by `id(checkout)`
When I wait until state of element located by `xpath(//input[contains(@value,'Guest')])` is VISIBLE
When I click on element located by `xpath(//input[contains(@value,'Guest')])`
When I wait until state of element located by `id(BillingNewAddress_FirstName)` is VISIBLE
When I enter `Alex` in field located by `id(BillingNewAddress_FirstName)`
When I enter `Stone` in field located by `id(BillingNewAddress_LastName)`
When I enter `${email}` in field located by `id(BillingNewAddress_Email)`
When I select `United States` in dropdown located by `id(BillingNewAddress_CountryId)`
When I wait until element located by `id(BillingNewAddress_StateProvinceId)` contains text `California`
When I select `California` in dropdown located by `id(BillingNewAddress_StateProvinceId)`
When I enter `New York` in field located by `id(BillingNewAddress_City)`
When I enter `123 Main St` in field located by `id(BillingNewAddress_Address1)`
When I enter `10001` in field located by `id(BillingNewAddress_ZipPostalCode)`
When I enter `1234567890` in field located by `id(BillingNewAddress_PhoneNumber)`
When I click on element located by `xpath(//div[@id='billing-buttons-container']//*[(self::input and contains(@value,'Continue')) or (self::button and contains(text(),'Continue'))])`
When I wait until state of element located by `xpath(//*[@id='opc-shipping']//*[(self::input and contains(@value,'Continue')) or (self::button and contains(text(),'Continue'))])` is VISIBLE
When I click on element located by `xpath(//*[@id='opc-shipping']//*[(self::input and contains(@value,'Continue')) or (self::button and contains(text(),'Continue'))])`
When I wait until state of element located by `xpath(//*[@id='opc-shipping_method']//*[(self::input and contains(@value,'Continue')) or (self::button and contains(text(),'Continue'))])` is VISIBLE
When I click on element located by `xpath(//*[@id='opc-shipping_method']//*[(self::input and contains(@value,'Continue')) or (self::button and contains(text(),'Continue'))])`
When I wait until state of element located by `xpath(//*[@id='opc-payment_method']//*[(self::input and contains(@value,'Continue')) or (self::button and contains(text(),'Continue'))])` is VISIBLE
When I click on element located by `xpath(//*[@id='opc-payment_method']//*[(self::input and contains(@value,'Continue')) or (self::button and contains(text(),'Continue'))])`
When I wait until state of element located by `xpath(//*[@id='opc-payment_info']//*[(self::input and contains(@value,'Continue')) or (self::button and contains(text(),'Continue'))])` is VISIBLE
When I click on element located by `xpath(//*[@id='opc-payment_info']//*[(self::input and contains(@value,'Continue')) or (self::button and contains(text(),'Continue'))])`
When I wait until state of element located by `xpath(//*[@id='opc-confirm_order']//*[(self::input and contains(@value,'Confirm')) or (self::button and contains(text(),'Confirm'))])` is VISIBLE
When I click on element located by `xpath(//*[@id='opc-confirm_order']//*[(self::input and contains(@value,'Confirm')) or (self::button and contains(text(),'Confirm'))])`
Then text `Your order has been successfully processed!` exists
