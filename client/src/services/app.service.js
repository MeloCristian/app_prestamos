import { API_URI } from './config';

export const getAll = async ( data ) => {
    return await fetch( `${API_URI}all/${data}`);
}

export const getAutocompletado = async ( ) => {
    return await fetch( `${API_URI}all/info`);
}

export const getSummary = async ( ) => {
    return await fetch( `${API_URI}all/summary`);
}