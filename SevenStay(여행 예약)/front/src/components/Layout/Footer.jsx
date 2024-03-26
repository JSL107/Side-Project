import React from 'react'
import classes from './Footer.module.css';
import { FaFacebook , FaInstagramSquare, FaTwitter } from "react-icons/fa";
import facebook from './images/facebook.png';

const Footer = () => {
  return (
    <div className={classes.footer}>
            <span>
              &copy;  2022 Seven Stay, Inc. 개인정보 처리방침·이용약관·사이트맵·한국의 변경된 환불 정책·회사 세부정보
            </span>
            <span className={classes.footer__icon}>
              {/* <FaFacebook size="24"/>
              <FaInstagramSquare size="24"/>
              <FaTwitter size="24"/> */}
              <img src={require('./images/facebook.png')} className={classes.footer__icon__a} />
              <img src={require('./images/insta.png')} className={classes.footer__icon__a} />
              <img src={require('./images/twitter.png')} className={classes.footer__icon__a} />
              <img src={require('./images/youtube.png')} className={classes.footer__icon__a} />
              <img src={require('./images/google.png')} className={classes.footer__icon__a} />
            </span>
    </div>
  )
}

export default Footer