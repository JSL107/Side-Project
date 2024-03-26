import React, { useState, useEffect} from 'react';
import List from './List';

const ACCOM = [
    {
        city: localStorage.getItem("위치"),
        checkIn: localStorage.getItem("체크인날짜"), 
        checkOut: localStorage.getItem("체크아웃날짜"),
        people: localStorage.getItem("총사람수") ,
        accommodationId : localStorage.getItem("업소명"),
    },
];

const data =() => {

}


const BASE_URL = 'http://localhost:8090/accommodation';
const Reserve = () => {
  const [lists, setLists] = useState(ACCOM);

  const reserveHandler = async () => {

    const data = {
      city: localStorage.getItem("위치"), 
      checkIn: localStorage.getItem("체크인날짜"),
      checkOut: localStorage.getItem("체크아웃날짜"),
      people: localStorage.getItem("총사람수"),
      accommodationName : localStorage.getItem("업소명"),
    };
  
    console.log(data);

    await fetch(BASE_URL, 
      {
        method: 'POST',
        headers: {
          'Content-Type' : 'application/json',
        },
        body: JSON.stringify(data),
      });
      setLists();
      
      localStorage.clear();
      localStorage.setItem("총사람수",0);
    }
    
    return (

      <div >
        <List click={reserveHandler} data = {data}/>
      </div>

  )
}

export default Reserve