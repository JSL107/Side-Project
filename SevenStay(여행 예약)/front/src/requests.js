const serviceKey = 'YEukg9vYNa2XQ2T2eMxHWTpFOXRqyvMyhtcBwq3Nh9TJUX2U81o%2FJ2M0mmbACuTXfutXx4tdfgESYSEbkNsSmQ%3D%3D';
// 대체키
// const API_KEY = 'YEukg9vYNa2XQ2T2eMxHWTpFOXRqyvMyhtcBwq3Nh9TJUX2U81o/J2M0mmbACuTXfutXx4tdfgESYSEbkNsSmQ==';
const pageNo = 1; // 필수 : 페이지 번호
const numOfRows = 10; // 필수 : 한 페이지 결과 수
const lodgeNm = '매화민박'; // 옵션 : 업소명
const addr = '금산면' // 옵션: 지번주소 또는 도로주소

const requests = {
    URL:`http://openapi.gimje.go.kr/rest/lodge/getLodgeList?ServiceKey=YEukg9vYNa2XQ2T2eMxHWTpFOXRqyvMyhtcBwq3Nh9TJUX2U81o%2FJ2M0mmbACuTXfutXx4tdfgESYSEbkNsSmQ%3D%3D&lodgeNm=%EB%A7%A4%ED%99%94%EB%AF%BC%EB%B0%95&addr=%EA%B8%88%EC%82%B0%EB%A9%B4`
}

export default requests;