<template>
    <div class="modal-content modal-comodato">
        <div class="modal-header">
            <h5 class="modal-title">
                <img src="@/assets/img/pdf.svg" width="40" height="40"/> Cargar comodato
            </h5>
            <button type="button" @click="cerrar" class="close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
        <div class="modal-body">
            <p class="text-center">Seleccione el comotado correspondiente al préstamo.</p>
            <p class="text-center">Recuerde ser cuidadoso al momento de cargar el comodato, y posteriormente revisar si fue cargado correctamente.</p>
            <form>
                <div class="form-group">
                    <label>Comodato: <span id="error-archivo" class="text-danger"></span></label>
                    <input type="file" @change="handleArchivo" class="form-control">
                </div>
            </form>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-primary" @click="cargarComodato" :disabled="!formCompleto">Cargar comodato</button>
            <button type="button" class="btn btn-danger" @click="cerrar">Cancelar</button>
        </div>
    </div>
</template>

<script>
import modalFileMixin from '@/mixins/modalFileMixin';
import { uploadComodato } from '../../services/prestamos.service';

export default {
    name: 'ModalComodato',
    mixins: [modalFileMixin],
    methods: {
        async cargarComodato() {
            const formData = this.crearFormData();
            if(formData) {
                this.$store.dispatch('showLoading');
                try {
                    const response = await uploadComodato(formData);
                    const result = await response.json();

                    this.$store.dispatch('hideLoading');
                    if(response.status === 200) {
                        this.$store.dispatch('showSuccess', result.message);
                        const nombreComodato = `${formData.get('qr')}_${formData.get('dni_estudiante')}.pdf`;
                        this.$store.dispatch('updateComodatoPrestamo', { 
                            id_prestamo: formData.get('id_prestamo'), 
                            comodato: nombreComodato
                        });
                        this.$store.dispatch('closeModal');
                    } else {
                        this.$store.dispatch('showError', result.error);
                    }
                } catch(error) {
                    console.error(error);
                    this.$store.dispatch('showError', 'Error inesperado al cargar el comodato.<br>Inténtelo más tarde.');
                }
            }
        },
        cerrar() {
            this.$store.dispatch('closeModal');
        }
    },
};
</script>

<style>
.modal-comodato {
    box-shadow: 0px 2px 25px 10px rgb(6, 68, 107, 0.2);
}
.modal-comodato .modal-header .modal-title {
    background-color: #06446b;
}
.modal-comodato .alerta {
    padding: 0;
}
.modal-comodato .form-control:focus {
    border: 1px solid #06446b;
}
</style>
