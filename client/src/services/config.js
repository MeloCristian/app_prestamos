export const API_URI = 'http://localhost:3000/';

export const setHeaders = (json = false) => {
    const headers = new Headers();
    const token = localStorage.getItem('token');
    if( token ) headers.append('Authorization', 'Bearer ' + token);
    if( json ) headers.append('Content-Type', 'application/json');
    return headers;
}
