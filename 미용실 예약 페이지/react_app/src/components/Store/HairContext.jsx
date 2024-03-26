import React from 'react'

// 형태를 만들어둔 상태
const HairContext = React.createContext({
    items: [],
    totalAmount: 0,
    addItem: (item) => { },
    removeItem: (id) => { }
});

export default HairContext