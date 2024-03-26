import React from 'react'

const ReservationItem = (props) => {
  return (
    <div>
        <span>{props.id}</span>
        <h2>{props.name}</h2>
        <span>{props.price}</span>
        <span>{props.image}</span>
        
    </div>
  )
}

export default ReservationItem