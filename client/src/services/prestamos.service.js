import { API_URI } from './config';

export const createPrestamo = async ( data ) => {
    return await fetch( `${API_URI}prestamos/`, {
        method: 'post',
        body: data
    });
}

export const uploadComodato = async ( data ) => {
    return await fetch( `${API_URI}prestamos/`, {
        method: 'put',
        body: data
    });
}
