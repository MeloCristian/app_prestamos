const modal = {
    state: {
        open: false,
        visible: false,
        show_modal: null,
        datos_modal: { }
    },
    mutations: {
		showModal(state, { show_modal, datos_modal }) {
            state.open = true;
            state.visible = true;
            state.show_modal = show_modal;
            state.datos_modal = datos_modal;
		},
		closeModal(state) {
			state.open = false;
            state.show_modal = null;
            state.datos_modal = { };
		},
		hideModal(state) {
			state.visible = false;
		}
    },
    actions: {
        showModal({ commit }, {show_modal, datos_modal = { } }) {
            commit("showModal", { show_modal, datos_modal });
        },
		closeModal({ commit }) {
			commit('hideModal');
			setTimeout(() => {
				commit('closeModal');
			}, 300);
		}
    }
}

export default modal;