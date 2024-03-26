import React , {useRef, useState} from "react";
import './Accom.css'
import FavoriteBorderSharpIcon from '@mui/icons-material/FavoriteBorderSharp';
import FavoriteSharpIcon from '@mui/icons-material/FavoriteSharp';

const Accom = (props, data) => {

  const [isActive, setActive] = useState("false");

  const handleToggle = () => {
    setActive(!isActive);
  };

  const getData = useRef();

  const getName = () => {
    localStorage.setItem("업소명",props.accommodationName);
    // console.log(data);
  }


  return (
    <div className="accom__accom"  >
      <div className="border__top"/>
      <div onClick={props.click} onMouseDown={getName} className="accoms">
        <div className="accom__images"> 
          <img className="accom__image" src="https://yaimg.yanolja.com/v5/2022/03/02/17/1280/621fa2ba34e367.82549922.jpg" />
        </div>
        <div className="accom__info">
          <div className="accom__info__top">
              <h3 className ="accom__name" ref={getData}>{props.accommodationName}</h3>
              <div className="heart__button" onClick={handleToggle}>
                {isActive ? <FavoriteBorderSharpIcon /> : <FavoriteSharpIcon />}
              </div>
          </div>
          <div className="thin__line"/>
          <div className="accom__description">{props.address}</div>
          <div className="accom__phoneNumber">☎ {props.phoneNumber}</div>
          <div className="border__bottom"/>
        </div>
      </div>
    </div>
  )
}

export default Accom