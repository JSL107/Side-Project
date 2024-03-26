import React, { useState } from 'react';
import CalenderModal from '../Layout/CalenderModal';
import './Calender.css'

const Calender = () => {
  const [modalOpen, setModalOpen] = useState(false);
  let [date1, setDate1] = useState("날짜 선택");
  let [date2, setDate2] = useState("날짜 선택");

  const openModal = () => {
    setModalOpen(true);
  };
  const closeModal = () => {
    setModalOpen(false);
  };

  const [click, setClick] = useState(true);

  let setTransDate = (dates) => {

    if (click === true) {
      setClick(false);
      let day1 = dates.toLocaleDateString();
      date1 = localStorage.setItem('체크인날짜',day1);
      setDate1(date1);
    }
    else {
      setClick(true);
      let day2 = dates.toLocaleDateString();
      date2 = localStorage.setItem('체크아웃날짜',day2);
      setDate2(date2);
    };
  }
 
  return (
    <div className="calender">
      <div className="date__picker" id="in">
        <div className='navi_checkin' onClick={openModal}>체크인</div>
        <CalenderModal open={modalOpen} close={closeModal} dates={setTransDate}/>
        <div id="datePickerText1" type="text" className='date__picker_text' onClick={openModal}> {localStorage.getItem('체크인날짜') ?? "날짜 선택"}</div>
      </div>
      <div className="navi__line" />

      <div className="date__picker" id="out">
        <div className='navi__checkout' onClick={openModal}>체크아웃</div>
        <CalenderModal open={modalOpen} close={closeModal} dates={setTransDate}/>
        <div id="datePickerText2" className='date__picker_text' onClick={openModal}> {localStorage.getItem('체크아웃날짜') ?? "날짜 선택"}</div>
        <div className="navi__date">
        </div>
      </div>
    </div>
  )
}
export default Calender
