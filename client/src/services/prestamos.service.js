import { API_URI, setHeaders } from './config';

export const createPrestamo = async ( data ) => {
    return await fetch( `${API_URI}prestamos/`, {
        method: 'post',
        body: data,
        headers: setHeaders()
    });
}

export const uploadComodato = async ( data ) => {
    return await fetch( `${API_URI}prestamos/`, {
        method: 'put',
        body: data,
        headers: setHeaders()
    });
}
