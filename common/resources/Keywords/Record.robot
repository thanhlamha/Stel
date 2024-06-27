*** Settings ***
Resource    ../libraries/Library.robot
*** Keywords ***
Start Recording
    ScreencapLibrary.Start Video Recording    filename=recording.mp4
Stop Recording
    ScreencapLibrary.Stop Video Recording