import React from 'react'

const GuestContext = React.createContext({
    items: [], 
    totalAmount: 0, 
    addItem: (item) => {},
});

export default GuestContext