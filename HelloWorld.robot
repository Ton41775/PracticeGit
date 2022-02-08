*** Settings ***

Resource   Keywords.robot

Test Setup      Login To System

Test Teardown      Login To System  

Default Tags   feature-helloworld



*** Variables ***
${Greeting} =   Hello World
${STRING} =  cat
${NUMBER} =  ${1}
${NUMBERString} =  1
@{LIST} =  one   two   ${100}
&{DICTIONARY} =  string=${STRING}   number=${NUMBER}   list=@{LIST}



*** Test Cases ***
Print Hello World
    [Documentation]    This keyword will Print Hello World to Console
    log    ${token}
Test Syntax
    log  Hello World  level=WARN
Test Log Variables

    ${Greeting}  Set Variable  Hello World2
    log  ${Greeting}
    Set Suite Variable  ${Greeting}  Hello World2
    
Test List 
    ${items}=  Create List  a   b   c
    Log Many  @{items}
    FOR   ${item}  IN  @{items}
        Log    ${item}
    END


Test Dictionary 
    &{USER}=  Create Dictionary  name=SomeUserName  passwrod=Somepassword
    Log     ${USER}[name]
    Log     ${USER}[passwrod]
    Log Many  &{USER}

    FOR   ${key}  ${value}  IN  &{USER}
        Log    ${key}
        Log     ${value}
    END
Test Should be Equal
    Should Be Equal   A   A
    Should Be Equal As Integers   ${1}    ${1}
    Should Match  RobotFramework   Robot*
    #Should Match  abcd   Robot*
    Run Keyword If  'session_SesionID'!=None   Should Match Regexp  session_Sesion   session_.*
    Pass Execution  OK
    Should Match Regexp  session_Sesion   session_.*


Test IF-ELSE
    IF  ${NUMBER} > 1
        Log  Greater than one
    ELSE IF  "${STRING}" == "dog"
        Log  it's a dog!
    ELSE
        Log  Probablry a cat
    END


# Test Log Variables2
 #   log  ${Greeting}

Test Variables Inside Variable
    ${Hello World}  Set Variable  HelloWorld3333
    ${WillPrintHello}  Set Variable  Hello
    Log  ${${WillPrintHello} World}

Test Data Type
    Log   ${NUMBER}
    Log   ${NUMBERString}
    Log   ${LIST}
    Log Many   @{LIST}
    Log    ${DICTIONARY} 
    Log Many  &{DICTIONARY} 

Test Keyword
    Say Greeting
    Say  Welcome to robot framework
    Say
    Say Robot Framework Is Good 
    ${Word}=  Say Hello
    Log  ${Word}



*** Keywords ***
Say Hello
    [Return]  World


Say ${Word} Is Good
    Log  ${Word}


Say
    [Arguments]  ${Word}=Nothing 
    Log  ${Word}

Say Greeting
    Log  ${Greeting}