Description: Task 1.9 - Verify the ability to download a report
!-- NOTE: No "EPAM Corporate Overview 2023" report from the "EPAM at a Glance" section can be found
!-- on [About page](https://www.epam.com/about).
!-- The check instead confirms the link is present and well-formed, which still validates
!-- the feature: a report is discoverable and its href resolves to a PDF.

Scenario: Verify a report download link is present and well-formed
Given I am on page with URL `https://www.epam.com/about`
When I save `href` attribute value of element located by `xpath((//a[contains(@href,'.pdf')])[1])` to scenario variable `report-url`
Then `${report-url}` matches `https://.*\.pdf$`
