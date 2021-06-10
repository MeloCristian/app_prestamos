import Vue from "vue";
import Vuex from "vuex";

//Modules
import alertas from './alertas';
import modal from './modal';

Vue.use(Vuex);

export default new Vuex.Store({
    state: {
        info_autocompletado: {},
        all_info: {
            informacion: [],
            prestamos: [],
            registros: []
        },
    },
    mutations: {
        setInfoAutocompletado( state, info_autocompletado ) {
            state.info_autocompletado = info_autocompletado;
        },
        setAllInfo( state, all_info ) {
            state.all_info = all_info;
        },
        setNewPrestamo( state, prestamo ) {
            state.all_info.prestamos.unshift(prestamo);
        },
        setNewRegistro( state, registro ) {
            state.all_info.registros.push(registro);
        },
        updateComodatoPrestamo( state, { id_prestamo, comodato } ) {
            const idxPrestamo = state.all_info.prestamos.findIndex(p => p.id_prestamo == id_prestamo);
            state.all_info.prestamos[idxPrestamo].comodato = comodato;
        },
        updateEvidenciaPrestamo( state, { id_prestamo, evidencia } ) {
            const idxPrestamo = state.all_info.prestamos.findIndex(p => p.id_prestamo == id_prestamo);
            state.all_info.prestamos[idxPrestamo].evidencia = `${evidencia}?${Date.now()}`; //Para frozar la descarga de la nueva imágen. y evitar la caché
        },
        finalizarRegistro( state, { id_registro, fecha } ) {
            const idxRegistro = state.all_info.registros.findIndex(r => r.id_registro == id_registro);
            state.all_info.registros[idxRegistro].fecha_fin = fecha;
        },
        finalizarPrestamo( state, { id_prestamo, fecha } ) {
            const idxPrestamo = state.all_info.prestamos.findIndex(p => p.id_prestamo == id_prestamo);
            state.all_info.prestamos[idxPrestamo].fecha_fin = fecha;
        }
    },
    actions: {
        setInfoAutocompletado( { commit }, info_autocompletado ) {
            commit('setInfoAutocompletado', info_autocompletado);
        },
        setAllInfo( { commit }, all_info ) {
            commit('setAllInfo', all_info);
        },
        setNewPrestamo( { commit }, prestamo ) {
            commit('setNewPrestamo', prestamo);
        },
        setNewRegistro( { commit }, registro ) {
            commit('setNewRegistro', registro);
        },
        updateComodatoPrestamo( { commit }, { id_prestamo, comodato } ) {
            commit('updateComodatoPrestamo', { id_prestamo, comodato });
        },
        updateEvidenciaPrestamo( { commit }, { id_prestamo, evidencia } ) {
            commit('updateEvidenciaPrestamo', { id_prestamo, evidencia });
        },
        finalizarRegistro({ commit }, { id_registro, fecha } ) {
            commit('finalizarRegistro', { id_registro, fecha });
        },
        finalizarDevolucion({ commit }, { id_prestamo, id_registro, fecha } ) {
            commit('finalizarRegistro', { id_registro, fecha });
            commit('finalizarPrestamo', { id_prestamo, fecha });
        }
    },
    modules: {
        alertas,
        modal
    },
});
