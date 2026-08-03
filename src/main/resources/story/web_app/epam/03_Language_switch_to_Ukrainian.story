Description: Task 1.3 - Verify the ability to change the site language to Ukrainian
!-- Selecting "Україна (Українська)" navigates to a separate domain (careers.epam.ua)
!-- rather than switching language in place on epam.com, so the assertion checks the
!-- resulting URL rather than page text. Uses `matches` (regex) rather than `contains`,
!-- which isn't a recognized comparison for this generic variable-assertion step.

Scenario: Verify switching site language to Ukrainian
Given I am on page with URL `https://www.epam.com`
When I click on element located by `cssSelector(.location-selector__button)`
When I click on element located by `cssSelector(a[lang='uk'])`
Then `${current-page-url}` matches `.*epam\.ua.*`
Then text `Вакансії` exists
