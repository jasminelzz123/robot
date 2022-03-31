*** Keywords ***
Begin Web Test
    Open Browser  about:blank  ${BROWSER}

Go To Web Page
    Load Page
    Verify Start Page Loaded

Load Page
    Go To      ${URL}

Verify Start Page Loaded
    Wait Until Page Contains  Infotiv Car Rental
    Sleep  2s

Click On About Text
    Click Element   id:about
    Sleep  2s

Verify Current URL Is About Page
    Location Should Be      ${ABOUT_PAGE}
    Sleep  2s

Verify Earliest Selectable Date Is Today
    ${start_date}     Get Element Attribute   id:start    min
    ${current_date}   Get Current Date   result_format=%Y-%m-%d
    Should Be Equal   ${current_date}   ${start_date}
    Sleep  2s

Log In An Existing Account
    Access To Log In Page
    Enter Username
    Enter Password
    Should Be Successfully Logged On

Access To Log In Page
    Page Should Contain Element   id:login

Enter Username
    Input Text  id:email    test@test.se

Enter Password
    Input Password  id:password     1234567

Should Be Successfully Logged On
    Click Button    id:login
    Wait Until Page Contains Element   id:welcomePhrase
    Sleep  2s

Book A Car
    Shoud Be In Date Selction Page
    Click Continue Button
    Go To Car Selection Page
    Click Book Button
    Go To Confirm Page
    Confirm Booking
    Clear Booking Test Date

Shoud Be In Date Selction Page
    Page Should Contain Element   id:tripQuestion

Click Continue Button
    Click Button    id:continue

Go To Car Selection Page
    Wait Until Page Contains Element  //*[@id="questionText"]
    Sleep  2s

Click Book Button
    Press Keys   //*[@id="bookQ7pass5"]  RETURN

Go To Confirm Page
    Wait Until Page Contains Element   id:confirmQuestion
    Sleep  2s

Confirm Booking
    Input Text      id:cardNum      1234567890123456
    Input Text      id:fullName     aa
    Input Text      id:cvc          111
    Click Button    id:confirm
    Wait Until Page Contains Element    id:confirmMessage
    Sleep  2s

Clear Booking Test Date
    Click Element   //*[@id="mypage"]
    Wait Until Page Contains    Mypage
    Sleep  5s
    Click Element   id:unBook1
    Handle Alert    ACCEPT   timeout=2s

End Web Test
    Close Browser
