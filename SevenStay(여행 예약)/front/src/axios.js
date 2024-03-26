import axios from 'axios';

const instance = axios.create({
    baseURL: 'http://openapi.gimje.go.kr/rest/lodge/getLodgeList',
});

export default instance;
