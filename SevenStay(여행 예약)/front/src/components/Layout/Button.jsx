import React , { useContext, useState } from "react";
import SearchIcon from '@mui/icons-material/Search';


const BASE_URL = 'http://localhost:8090/api/v1/orders';

const Button = () => {
    return (     
    <div>
        <SearchIcon type={'button'}></SearchIcon>
    </div>
  )
}

export default Button