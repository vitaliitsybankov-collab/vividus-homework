Description: Task 1.2 - Verify the ability to switch between Light and Dark modes

Scenario: Verify switching from Light to Dark theme (and back)
Given I am on page with URL `https://www.epam.com`
When I save `class` attribute value of element located by `cssSelector(body)` to scenario variable `initial-theme-class`
When I click on element located by `cssSelector(.theme-switcher .switch)`
When I save `class` attribute value of element located by `cssSelector(body)` to scenario variable `updated-theme-class`
Then `${updated-theme-class}` is not equal to `${initial-theme-class}`
