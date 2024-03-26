import React, { useContext } from 'react';
import './PlacesRow.css'

const PlacesRow = (props) => {

  return (

    <div className='row__container'>

        <div className='row__desc'>
            <h1>Recommand Places to stay</h1>
        </div>

        <div className='row__content'>

            <a href="../Layout/Place/서귀포" className='places__box'>
                <img className='places__row' src="https://cdn.pixabay.com/photo/2016/10/06/17/28/architecture-1719526_960_720.jpg"/>
                <p className='places__text'>서귀포</p>
            </a>
            
            <a href="../Layout/Place/시내동" className='places__box'>
                <img className='places__row' src="https://cdn.pixabay.com/photo/2016/11/18/17/46/house-1836070__340.jpg"/>
                <p className='places__text'>시내동</p>
            </a>
            
            <a href="../Layout/Place/조천읍" className='places__box'>
                <img className='places__row' src="https://cdn.pixabay.com/photo/2016/12/30/07/59/kitchen-1940174__340.jpg"/>
                <p className='places__text'>조천읍</p>
            </a>

        </div>

    </div>

  )
}

export default PlacesRow