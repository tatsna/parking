*** Settings ***
Library   Selenium2Library

Resource   ${EXECDIR}/e2e/resource/keyword.robot
Resource   ${EXECDIR}/e2e/resource/variable.robot

*** Variables ***

${urlmainpage}    http://localhost:3000/

*** Test Cases ***

test เช็กอินปกติได้
  ตรวจสอบการเข้าถึงหน้าแรก    ${urlmainpage}

  # ตรวจสอบคลิกปุ่ม
  Wait Until Page Contains Element  id:btnCheckin
  
  # คลิกปุ่มเช็กอินเปิดหน้าต่างเช็กอิน
  Click Element   id:btnCheckin
  Wait Until Page Contains Element  id:checkinPopup
  
  # ตรวจสอบรูปภาพเช็กอิน
  Wait Until Page Contains Element  id:imageCheckin

  # กรอกข้อมูลทะเบียนรถได้
  Wait Until Page Contains Element  id:inputCarNumber
  Input Text    id:inputCarNumber   1111

  # กรอกข้อมูลRFID
  Wait Until Page Contains Element  id:inputRFID
  Input Text    id:inputRFID   1

  # กดปุ่มบันทึกเช็กอินได้
  Wait Until Page Contains Element  id:btnSubmitCheckin
  Click Element   id:btnSubmitCheckin

  # กดปุ่มบันทึกเช็กอินสำเร็จ
  Wait Until Page Contains Element  id:alert_message
  Element Text Should Be    id:alert_message    สำเร็จ

  # กดยืนยัน
   Wait Until Page Contains Element  id:btnAlertOK
   Click Element   id:btnAlertOK

   # ปิดหน้าต่างเช็กอินแล้ว
   Wait Until Page Does Not Contain Element   id:checkinPopup

   # จำนวนรถเข้า1คัน
   Element Text Should Be    id:car_amount    1

   # จำนวนเต็ม error
   Element Text Should Be    id:car_amount    1