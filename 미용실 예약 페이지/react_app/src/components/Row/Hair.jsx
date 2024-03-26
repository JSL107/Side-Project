import React from 'react'
import './Hair.module.css'
import Button from '../Commons/Button'

const Hair = (props) => {

    const submitHandler = (event) => {
        event.preventDefault();
        console.log('submitHandler called');
    }

    const hair={
        id:props.id,
        name: props.name,
        price: props.price
    }

  return (
    <div className='hairContent'>

        <Button type='submit' onClick={submitHandler} className='hairBox'>
            <div className='styleImage'>
                <img src="https://images.unsplash.com/photo-1620122830785-a18b43585b44?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80" alt="" />
            </div>
            <div className='styleText'>
                <p className='hairName'>cut1</p>
                <p className='price'>20,000원</p>
            </div>
        </Button>
        

        <Button type='submit' onClick={submitHandler} className='hairBox'>
            <div className='styleImage'>
                <img src="https://images.unsplash.com/photo-1620122830785-a18b43585b44?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80" alt="" />
            </div>
            <div className='styleText'>
                <p className='hairName'>cut1</p>
                <p className='price'>20,000원</p>
            </div>
        </Button>

        <Button type='submit' onClick={submitHandler} className='hairBox'>
            <div className='styleImage'>
                <img src="https://images.unsplash.com/photo-1587776535733-b4c80a99ef82?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=341&q=80" alt="" />
            </div>
            <div className='styleText'>
                <p className='hairName'>cut2</p>
                <p className='price'>20,000원</p>
            </div>
        </Button>

        <Button type='submit' onClick={submitHandler} className='hairBox'>
            <div className='styleImage'>
            <img src="https://images.unsplash.com/photo-1617896848219-5ec29570d680?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80" alt="" />
            </div>
            <div className='styleText'>
                <p className='hairName'>cut3</p>
                <p className='price'>20,000원</p>
            </div>
        </Button>

        <Button type='submit' onClick={submitHandler} className='hairBox'>
            <div className='styleImage'>
                <img src="https://images.unsplash.com/photo-1615363001828-acfd7ac403cf?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80" alt="" />
            </div>
            <div className='styleText'>
                <p className='hairName'>cut4</p>
                <p className='price'>20,000원</p>
            </div>
        </Button>

        <Button type='submit' onClick={submitHandler} className='hairBox'>
            <div className='styleImage'>
                <img src="https://images.unsplash.com/photo-1629617375711-8f591cfa357e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=386&q=80" alt="" />
            </div>
            <div className='styleText'>
                <p className='hairName'>cut5</p>
                <p className='price'>20,000원</p>
            </div>
        </Button>

    </div>

  )
}

export default Hair