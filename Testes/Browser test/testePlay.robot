*** Settings ***
Library    Browser

*** Test Cases ***
Example Test
    New Browser    browser=chromium    headless=False
    New Page    https://playwright.dev
    Get Text    h1    contains    Playwright
    Sleep    5
