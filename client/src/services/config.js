export const API_URI = 'http://localhost:3000/';

export const setHeaders = () => {
    const headers = new Headers();
    const token = localStorage.getItem('token');
    if(token) headers.append('Authorization', 'Bearer ' + token);
    return headers;
}
