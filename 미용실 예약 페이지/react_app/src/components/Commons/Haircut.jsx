import React, { useContext, useState } from 'react';
import './Haircut.css'
import Button from '../Commons/Button'
import Modal from '../Reserve/Modal'
import HairContext from '../Store/HairContext';

const Haircut = (props) => {
  const hairContext = useContext(HairContext);
    
  const submitHandler = (name) => {
    
    const hair = {
      id: props.id,
      image: props.image,
      name: name,
      price: props.price
    }
    hairContext.addItem(hair);
    // alert(props.name+'를 예약하셨습니다.')
  }

  
  //modal창 열림
  const [modalOpen, setModalOpen] = useState(false);

  const openModal = () => {
    setModalOpen(true);
  };
  const closeModal = () => {
    setModalOpen(false);
  };

  return (
    <div className='hairContent'>
      <Button type='submit' onClick={openModal}>
        <img className="hairImage" src={props.image}/>
      </Button>
      <div className='styleText'>
        <div className='hairName'><h1>{props.name}</h1></div>
        <div className='hairPrice'>{props.price}</div>
      </div>

        <div>

          <Modal open={modalOpen} close={closeModal} header={props.name} price={props.price}>
            <img className="hairImage" src={props.image}/>
            <button onClick={submitHandler} >선택완료</button>
            <button onClick={props.close}>닫기</button>
         </Modal>
         </div>
    </div>
  )
}
export default Haircut


