import { API_URI } from './config';

export const crearRevision = async ( data ) => {
    return await fetch( `${API_URI}revisiones/`, {
        method: 'post',
        body: data
    });
}

export const terminarRevision = async ( data ) => {
    return await fetch( `${API_URI}revisiones/`, {
        method: 'put',
        body: data
    });
}

export const crearDevolucion = async ( data ) => {
    return await fetch( `${API_URI}devoluciones/`, {
        method: 'post',
        body: data
    });
}

export const terminarDevolucion = async ( data ) => {
    return await fetch( `${API_URI}devoluciones/`, {
        method: 'put',
        body: data
    });
}
