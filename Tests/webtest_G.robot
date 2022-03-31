*** Settings ***
Documentation   Some information about the whole test suite
Library  SeleniumLibrary
Library  robot.libraries.DateTime
Resource  ../Resources/keywords.robot
Suite Setup  Begin Web Test
Suite Teardown   End Web Test

*** Variables ***
${BROWSER}  chrome
${URL}      http://rental6.infotiv.net/webpage/html/gui/index.php
${ABOUT_PAGE}   http://rental6.infotiv.net/webpage/html/gui/about.php



*** Test Cases ***
Access To Website
    [Documentation]     This is some basic information about the test
    [Tags]  Header
    Go To Web Page

User Can Click On About Text And Divert Back To About Page
    [Documentation]     This is some basic information about the second test
    [Tags]  Header
    Go To Web Page
    Click On About Text
    Verify Current URL Is About Page

Verify Start Date
    [Documentation]   This is some basic information about the test on the earliest selectable start date is today
    [Tags]   Date Selection
    Go To Web Page
    Verify Earliest Selectable Date Is Today