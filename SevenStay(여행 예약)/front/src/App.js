import {BrowserRouter, Routes, Route} from 'react-router-dom';
import './App.css';
import Nav from './components/Navigation/Nav';
import CalenderModal from './components/Layout/CalenderModal';
import Home from './components/Layout/Home';
import Reserve from './components/Store/Reserve'
import List from './components/Store/List'
import Place from './components/Layout/Place';
import Footer from './components/Layout/Footer';

function App() {
  return (
    <div className="App">
       <BrowserRouter>

        <Nav>
          <CalenderModal/>
        </Nav>

        <Routes>
         <Route path="/" element={<Home/>}> </Route> 
         <Route path="/Store/Reserve" element={<Reserve/>}> </Route>
         <Route path="/Store/List" element={<List/>}> </Route>
         <Route path="/Layout/Place/:id" element={<Place/>}> </Route>
        </Routes>

        <Footer/>

      </BrowserRouter>
    </div>
  );
}

export default App;
