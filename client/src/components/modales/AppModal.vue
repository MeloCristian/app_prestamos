<template>
    <div class="modal" :class="{ 'block' : modal.open }">
        <div class="container-modal animate__animated animate__faster" :class="{'animate__fadeInUp' : modal.visible, 'animate__fadeOutDown' : !modal.visible}" role="document">
            <component :is='showModal'></component>
        </div>
    </div>
</template>
 
<script>
export default {
    name: "AppModal",
    computed: {
        modal() {
            return this.$store.state.modal;
        },
        showModal() {
            return this.$store.state.modal.show_modal;
        }
    },
    methods: {
        cerrar() {
            this.$store.dispatch('closeModal');
        }
    },
    components: {
        ModalPrestamo: () => import(/* webpackChunkName: "modalPrestamo" */ "./ModalPrestamo"),
        ModalGarantia: () => import(/* webpackChunkName: "modalPrestamo" */ "./ModalGarantia"),
        ModalDevolucion: () => import(/* webpackChunkName: "modalPrestamo" */ "./ModalDevolucion"),
        ModalComodato: () => import(/* webpackChunkName: "modalPrestamo" */ "./ModalComodato"),
    }
};
</script>

<style>
.modal.block {
    display: block;
}
.modal {
    position: fixed;
    top: 0;
    left: 0;
    z-index: 1060;
    display: none;
    width: 100%;
    height: 100%;
    overflow-x: hidden;
    overflow-y: auto;
    outline: 0;
    background-color: rgba(0, 0, 0, 0.3);
    padding: 0 1rem;
}
.container-modal {
    max-width: 500px;
    margin: 3rem auto;
    position: relative;
    width: auto;
    /* width: 500px;
    height: 300px;
    background-color: #FFF; */
}
.modal-content {
    background-color: #FFF;
}
.modal-header {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-negative: 0;
    flex-shrink: 0;
    -ms-flex-align: center;
    align-items: center;
    -ms-flex-pack: justify;
    justify-content: space-between;
    /* padding: 1rem 1rem; */
    border-bottom: 1px solid #eceeef;
}

.modal-header .modal-title {
    width: 100%;
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 10px 15px;
    margin-bottom: 0;
    font-size: 1.2rem;
    background: #0c6cac;
    color: #FFF;
    font-weight: 700;
}

.modal-header .modal-title img {
    width: 40px;
    height: auto;
    margin-right: 5px;
}
.modal-header .close {
    position: absolute;
    border: 0;
    right: 15px;
    cursor: pointer;
    opacity: .8 ;
    color: #FFF;
    font-weight: 700;
    background: none;
    font-size: 45px;
    transition: .3s ease all;
}
.modal-header .close:hover {
    opacity: 1;
}
.modal-body {
    position: relative;
    -ms-flex: 1 1 auto;
    flex: 1 1 auto;
    padding: 1rem;
}
.modal-body p {
    margin-bottom: 0px;
    font-size: 0.95rem;
    font-weight: 400;
}
.modal-body form {
    margin-top: 10px;
}
.form-group label {
    display: block;
    margin-left: 17px;
    font-size: 0.75rem;
    font-weight: 700;
    margin-bottom: -8px;
}
.modal-footer {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-wrap: wrap;
    flex-wrap: wrap;
    -ms-flex-negative: 0;
    flex-shrink: 0;
    -ms-flex-align: center;
    align-items: center;
    -ms-flex-pack: end;
    justify-content: flex-end;
    padding: 0.2rem 0.9rem;
    border-top: 1px solid #eceeef;
}
</style>