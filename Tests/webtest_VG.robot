*** Settings ***
Documentation   Some information about the whole test on navigation flow of booking a car
Library  SeleniumLibrary
Resource  ../Resources/keywords.robot
Suite Setup  Begin Web Test
Suite Teardown   End Web Test

*** Variables ***
${BROWSER}  chrome
${URL}      http://rental6.infotiv.net/webpage/html/gui/index.php

*** Test Cases ***
User Can Access To Start Page And Log In An Existing Account And Book A Car
     [Documentation]    This is some basic information about the test
     [Tags]  VG_test
     Given Go To Web Page
     When Log In An Existing Account
     Then Book A Car