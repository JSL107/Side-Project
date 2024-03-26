import React from 'react'
import { useParams} from 'react-router-dom';
import LandingPage from '../Place/LandingPage';

const Place = (props) => {
  const { id } = useParams();

  return (
    <div className='place__container'>
      <h2> {id}지역 </h2>
      <LandingPage id = {props.id}/>
    </div>
  )
}

export default Place