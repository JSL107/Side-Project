import React from 'react';
import './Banner.css'

const Banner = () => {

  return (
    <div className='content'>
      <div className='header'>
        <img  className='headerImage' src="https://images.unsplash.com/photo-1585325565018-a80fcd1f4c8a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80" alt="" />
      </div>

      <div className='headerContent'>
        <h1>CutCut Salon
        </h1>
          <p>Lorem ipsum dolor sit amet consectetur adipisicing elit.</p>
          <p>Lorem ipsum dolor sit amet consectetur adipisicing elit.</p>
          <p>Lorem ipsum dolor sit amet consectetur adipisicing elit.</p>
          <br></br>
          
          {/* <button className="reserveButton"><Reservation />예약</button> */}
      </div>
      
    </div>

  )
}

export default Banner