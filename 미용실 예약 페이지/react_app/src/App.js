import './App.css';
import Nav from './components/Navigation/Nav';
import Banner from './components/Banner/Banner';
import HairStyle from './components/HairStyle/HairStyle';
import Reservation from './components/Reserve/Reservation';

function App() {
  return (
    <div className="App">
      {/* <ReservProvider> */}
        {/*Navigator 부분*/}
        <Nav />
        {/*이미지 큰 사진 부분*/}
        <Banner />
        {/*예약기능 부분*/}
        <Reservation />
        <div className='reserveContent'>
          Select Your Hair Style
        </div>
        {/* 머리스타일 사진 부분*/}
        <HairStyle />
      {/* </ReservProvider> */}
    </div>
  );
}

export default App;
