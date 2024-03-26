import React, { useState } from 'react'
import Map from './Map'
import './LadingPage.css'
import MapContainer from './MapContainer'

const LandingPage = (id) => {
  const [InputText, setInputText] = useState('')
  const [Place, setPlace] = useState('')

  const onChange = (e) => {
    setInputText(e.target.value)
  }

  const handleSubmit = (e) => {
    e.preventDefault()
    setPlace(InputText)
    setInputText('')
  }

  return (
    <>
      <form className="input__form" onSubmit={handleSubmit}></form>
      {/*<MapContainer searchPlace={id.id} />*/}
      <Map searchPlace={id.id} />
    </>
  )
}

export default LandingPage