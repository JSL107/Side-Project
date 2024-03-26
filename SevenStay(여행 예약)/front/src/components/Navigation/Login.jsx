import React, { useState } from 'react';
import LoginModal from '../Layout/LoginModal';
import DehazeIcon from '@mui/icons-material/Dehaze';
import AccountCircleIcon from '@mui/icons-material/AccountCircle';
import './Login.css'


const Login = () => {

    const [modalOpen, setModalOpen] = useState(false);

    const openModal = () => {
        setModalOpen(true);
    };
    const closeModal = () => {
        setModalOpen(false);
    };

    return (
      <>
        <button type='button' className='navi__rb' onClick={openModal}>
          <div className='deha'>
            <DehazeIcon />
          </div>
          <div className='account'>
            <AccountCircleIcon />
          </div>
        </button>

        <div>
          <LoginModal open={modalOpen} close={closeModal}></LoginModal>
        </div>
      </>    
    )
}

export default Login