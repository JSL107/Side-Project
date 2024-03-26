import React, { useState } from 'react';
import DatePicker from "react-datepicker";
import "react-datepicker/dist/react-datepicker.css";
import classes from '../Reserve/Calender.module.css'

const Calender = ({header,close,hairprice}) => {
  const [startDate, setStartDate] = useState(new Date());

  const btn = () =>  {
    let money = hairprice*10000;
    alert(startDate.toLocaleString()+"에 " + {header}.header +"과정을 예약하셨습니다." + "\n금액은" + money.toLocaleString('en-AU') + "원 입니다.");

  }
  return (
    <div>
      <h3 className=''>예약 날짜와 시간선택</h3>

      <DatePicker
        minDate={new Date()}
        popperPlacement="auto"
        selected={startDate}
        showTimeSelect
        timeFormat="HH:mm"
        timeIntervals={30}
        timeCaption="time"
        dateFormat="yyyy, MMMM d h:mm aa"
        value={startDate}
        onChange={(date) => {
          setStartDate(date);
        }}
      />

      {/* <h3>예약 내역</h3>
      <div>{startDate.toLocaleString()}</div> */}
      <div>
      <br></br>
      <button className={classes.button} onClick={btn} >선택완료</button>
      <button className={classes.button} onClick={close} >닫기</button>
          
      </div>


    </div>
  )

}
export default Calender