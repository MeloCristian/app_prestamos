import { API_URI, setHeaders } from './config';

export const login = async ( data ) => {
    return await fetch( `${API_URI}all/login`, {
        method: 'post',
        body: data,
        headers: {
            'Content-Type' : 'application/json'
        }
    });
}

export const isLogged = async ( ) => {
    return await fetch( `${API_URI}all/is_logged`, {
        headers: setHeaders()
    });
}

export const getAll = async ( data ) => {
    return await fetch( `${API_URI}all/${data}`, {
        headers: setHeaders()
    });
}

export const getAutocompletado = async ( ) => {
    return await fetch( `${API_URI}all/info`);
}

export const getComodatario = async ( dni ) => {
    return await fetch( `${API_URI}all/comodatario/${dni}`);
}

export const getSummary = async ( ) => {
    return await fetch( `${API_URI}all/summary`);
}