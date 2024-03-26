import React, { useState } from 'react'
import Haircut from '../Commons/Haircut';
import './HairStyle.css'

const hairDesign = [
    {
        id: "cut1",
        image: "https://images.unsplash.com/photo-1615363001828-acfd7ac403cf?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
        name: "여성 커트일반",
        price: 2.5,
    },
    {
        id: "cut2",
        image: "https://images.unsplash.com/photo-1587776535733-b4c80a99ef82?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=341&q=80",
        name: "남성 커트일반",
        price: 2.5,
    },
    {
        id: "cut3",
        image: "https://images.unsplash.com/photo-1617896848219-5ec29570d680?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
        name: "염색",
        price: 2.2,
    },

    {
        id: "cut4",
        image: "https://images.unsplash.com/photo-1620122830785-a18b43585b44?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
        name: "드라이",
        price: 3.5,
    },
    {
        id: "cut5",
        image: "https://images.unsplash.com/photo-1629617375711-8f591cfa357e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=386&q=80",
        name: "펌",
        price: 5.5,
    }
];

const HairStyle = () => {
    const [hairs, setHairs] = useState(hairDesign);

    const hairList = hairs.map(hair =>
        <Haircut
            key={hair.id}
            id={hair.id}
            image={hair.image}
            name={hair.name}
            price={hair.price}
        />
        )
   
    return (
        <div className='box'>
            <div className='hairContainer'>
                {hairList}
            </div>
        </div>
    )
}

export default HairStyle