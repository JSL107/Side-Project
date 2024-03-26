import React from 'react';
import './LoginModal.css';


const LoginModal = (props) => {

  const { open , close } = props;

  return (
    <div className={open ? 'openModal logmodal' : 'logmodal'}>
      {open ? (

        <section className='section__login'>

          <main>
            <div className='signup'>회원가입</div>
            <div className='login'>로그인</div> 
            <div className='line' />
            <div className='menu'>예약내역</div>
            <div className='menu'>쿠폰함</div>
            <div className='line' />
            <div className='menu'>고객센터</div>
            <div className='menu'>공지사항</div>
            <div className='menu'>설정</div>
            <div className='line' />
          </main>

          <footer className="footer">
            <button type="button" className="close" onClick={close}>
              close
            </button>
          </footer>

        </section>
      ) : null}
    </div>
  )

}

export default LoginModal