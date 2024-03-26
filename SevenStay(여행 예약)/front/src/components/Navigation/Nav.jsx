import LanguageIcon from '@mui/icons-material/Language';
import React, {useState} from 'react';
import image from '../Navigation/images/7stay.png';
import Calender from './Calender';
import Button from '../Layout/Button'
import Guest from './Guest'
import Login from './Login'
import './Nav.css';


const Nav = () => {

  const [location, setLocation]=useState();

  const [letter, setLetter] = useState(localStorage.getItem("위치"));
  
  const locationData = () => {
    let text = document.getElementById('navi__input').value;
    setLocation(localStorage.setItem("위치", text));
    setLetter(text);
  }

 
  return (
    <div className='navi__container'>
      <div className="navi__empty"/>

      <a href='/'>
        <img className="store__title"
          src={image} alt="Seven stay title" />
      </a>

      {/* 네비게이션 예약 부분*/}
      <div className='navi__center'>
        <div className='navi__content' id='navidnlcl'>
          <div className='navi__location'>위치</div>
          <input id="navi__input" className="navi__input" placeholder='어디로 여행가세요?' onKeyUp={locationData} defaultValue={letter}></input>
        </div>
        <div className="navi__line" />

        <div className='navi__content' id="navi2" >   
          <Calender></Calender>
        </div>
        <div className="navi__line" />

        <div className='navi__content' id="label4">
          <Guest></Guest> 
        </div>

        <div className='navi__search'>
          <a href="../Store/Reserve">
            <Button type="submit" onClick={locationData}></Button>
          </a>
        </div>
      </div>

      {/* 네비게이션 로그인 부분*/}
      <div className='navi__right'>
        <div className='navi__lang'>
          <LanguageIcon />
        </div>

        <Login></Login>
      </div>
    </div>
  )

}

export default Nav