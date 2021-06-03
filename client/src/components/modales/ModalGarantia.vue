<template>
    <div class="modal-content modal-garantia">
        <div class="modal-header">
            <h5 v-if="!datosModal.fin_proceso" class="modal-title">
                <img src="@/assets/img/revision.svg" width="40" height="40"/> Garantía - Revisión
            </h5>
            <h5 v-else class="modal-title text-center">
                <img src="@/assets/img/check.svg" width="40" height="40"/> Terminar Garantía - Revisión
            </h5>
            <button type="button" @click="cerrar" class="close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
        <div class="modal-body">
            <p v-if="datosModal.fin_proceso" class="text-center">Para finalizar la revisión, seleccione fecha de finalización y el archivo de soporte en PDF</p>
            <p v-else class="text-center">Para iniciar la revisión, seleccione fecha de inicio y el archivo de soporte en PDF</p>

            <form>
                <div class="form-group">
                    <label v-if="!datosModal.fin_proceso">Fecha inicio:</label>
                    <label v-else>Fecha finalización:</label>
                    <input type="date" v-model="fecha" class="form-control" />
                </div>
                <div class="form-group">
                    <label>Soporte: <span id="error-archivo" class="text-danger"></span></label>
                    <input type="file" @change="handleArchivo" class="form-control">
                </div>
            </form>
        </div>
        <div class="modal-footer">
            <button v-if="!datosModal.fin_proceso" type="button" class="btn btn-warning" @click="crearRevision" :disabled="!formCompleto">Crear garantía</button>
            <button v-else type="button" class="btn btn-success" @click="terminarRevision" :disabled="!formCompleto">Finalizar </button>
            <button type="button" class="btn btn-danger" @click="cerrar">Cancelar</button>
        </div>
    </div>
</template>

<script>
import modalFileMixin from '@/mixins/modalFileMixin';
import { crearRevision, terminarRevision } from '../../services/registros.service';
export default {
    name: 'ModalGarantia',
    data() {
        return {
            fecha: ''
        }
    },
    mixins: [modalFileMixin],
    methods: {
        async crearRevision() {
            const formData = this.crearFormData();
            try {
                const response = await crearRevision(formData);
                const result = await response.json();
                if(response.status === 200) {
                    this.$store.dispatch('showSuccess', 'Se ha registrado la revisión del equipo correctamente');
                    this.$store.dispatch('setNewRegistro', result);
                    // Cierro el modal
                    this.$store.dispatch('closeModal');
                } else {
                    this.$store.dispatch('showError', result.error);
                }
            } catch( err ) {
                console.error(err);
                this.$store.dispatch('showError', 'Ah ocurrido un error al registrar la revisión. <br>Inténtelo más tarde');
            }
        },
        async terminarRevision() {
            const formData = this.crearFormData();
            try {
                const response = await terminarRevision(formData);
                const result = await response.json();
                if(response.status === 200) {
                    this.$store.dispatch('showSuccess', 'Se ha finalizado la revisión del equipo correctamente');
                    this.$store.dispatch('finalizarRegistro', {
                        id_registro: formData.get('id_registro'),
                        fecha: formData.get('fecha')
                    });
                    // Cierro el modal
                    this.$store.dispatch('closeModal');
                } else {
                    this.$store.dispatch('showError', result.error);
                }
            } catch( err ) {
                console.error(err);
                this.$store.dispatch('showError', 'Ah ocurrido un error al finalizar la revisión. <br>Inténtelo más tarde');
            }
        },
        cerrar() {
            this.$store.dispatch('closeModal');
        }
    },
};
</script>

<style>
.modal-garantia {
    box-shadow: 0px 2px 25px 10px rgb(255, 178, 54, 0.2);
}
.modal-garantia .modal-header .modal-title {
    background-color: #ffb236;
}
.modal-garantia .form-control:focus {
    border: 1px solid #ffb236;
}
</style>
