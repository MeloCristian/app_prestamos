import { API_URI, setHeaders } from './config';

export const crearRevision = async ( data ) => {
    return await fetch( `${API_URI}revisiones/`, {
        method: 'post',
        body: data,
        headers: setHeaders()
    });
}

export const terminarRevision = async ( data ) => {
    return await fetch( `${API_URI}revisiones/`, {
        method: 'put',
        body: data,
        headers: setHeaders()
    });
}

export const crearDevolucion = async ( data ) => {
    return await fetch( `${API_URI}devoluciones/`, {
        method: 'post',
        body: data,
        headers: setHeaders()
    });
}

export const terminarDevolucion = async ( data ) => {
    return await fetch( `${API_URI}devoluciones/`, {
        method: 'put',
        body: data,
        headers: setHeaders()
    });
}
