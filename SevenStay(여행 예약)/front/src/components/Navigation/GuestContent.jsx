import React , { useState } from 'react';
import './GuestModal.css'


const GuestContent = (props) => {

    const { open, close } = props;

    const [counterPeople, setCounterPeople] = useState(0);
    const [counterChild, setCounterChild] = useState(0);
    const [counterBaby, setCounterBaby] = useState(0);
    const [counterAnimal, setCounterAnimal] = useState(0);
    
    const decreaseNumber = () => { 
      if (counterPeople === 0) 
      {return;} 
      setCounterPeople(counterPeople-1);
    }
  
    const increaseNumber =() => {
      setCounterPeople(counterPeople+1);
    }
  
    const totalGuest = counterPeople + counterChild + counterBaby + counterAnimal;

    const countPeople = (people) => {
      props.people(people);
    }
  
    return (
      <div className={open ? 'openModal modal' : 'modal'}>
        {open ? (
          <section className='section__guest'>
            
            <div className='header__guest' onChange={countPeople(totalGuest)}>
              {totalGuest ? `게스트 ${totalGuest}명` : "게스트 추가"}
            </div>
  
            <main>
              <div className='modal__count'>
                <p className='modal__adult'>성인</p>
                <div className='modal__count__number'>
                  <button id='decrease' onClick={decreaseNumber} > - </button>
                  <p id='numberPeople'>{counterPeople}</p>
                  <button id='increase' onClick={increaseNumber} > + </button>
                </div>
              </div>
  
              <div className='modal__count'>
                <p className='modal__child'>어린이</p>
                <div className='modal__count__number'>
                  <button id='decrease' onClick={ ()=>{ if (counterChild === 0) {return;} setCounterChild(counterChild-1);} } type="submit"> - </button>
                  <p id='numberChild'>{counterChild}</p>
                  <button id='increase' onClick={ ()=>{setCounterChild(counterChild+1);}} > + </button>
                </div>
              </div>
  
              <div className='modal__count'>
                <p className='modal__baby'>유아</p>
                <div className='modal__count__number'>
                  <button id='decrease' onClick={ ()=>{ if (counterBaby === 0) {return;} setCounterBaby(counterBaby-1);} } > - </button>
                  <p id='numberBaby'>{counterBaby}</p>
                  <button id='increase' onClick={ ()=>{setCounterBaby(counterBaby+1);}} > + </button>
                </div>
              </div>
  
              <div className='modal__count'>
                <p className='modal__animal'>반려동물</p>
                <div className='modal__count__number'>
                  <button id='decrease' onClick={ ()=>{ if (counterAnimal === 0) {return;} setCounterAnimal(counterAnimal-1);} } > - </button>
                  <p id='numberAnimal'>{counterAnimal}</p>
                  <button id='increase' onClick={ ()=>{setCounterAnimal(counterAnimal+1);}} > + </button>
                </div>
              </div>
            </main>
  
            <footer>
              <button className="close" onClick={close}>
                close
              </button>
            </footer>
  
          </section>
        ) : null}
      </div>
    )

}

export default GuestContent