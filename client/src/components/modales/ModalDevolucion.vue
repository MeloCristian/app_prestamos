<template>
    <div class="modal-content modal-devolucion">
        <div class="modal-header">
            <h5 v-if="!datosModal.fin_proceso" class="modal-title">
                <img src="@/assets/img/devolucion.svg" width="40" height="40"/> Devolución del equipo
            </h5>
            <h5 v-else class="modal-title">
                <img src="@/assets/img/check2.svg" width="40" height="40"/> Finalizar Devolución
            </h5>
            <button type="button" @click="cerrar" class="close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
        <div class="modal-body">
            <p v-if="datosModal.fin_proceso" class="text-center">Para finalizar con la devolución, a continuación seleccione fecha de finalización y el archivo de soporte en PDF</p>
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
            <button v-if="!datosModal.fin_proceso" type="button" class="btn btn-info" @click="crearDevolucion" :disabled="!formCompleto">Iniciar devolución</button>
            <button v-else type="button" class="btn btn-success" @click="terminarDevolucion" :disabled="!formCompleto">Finalizar</button>
            <button type="button" class="btn btn-danger" @click="cerrar">Cancelar</button>
        </div>
    </div>
</template>

<script>
import modalFileMixin from '@/mixins/modalFileMixin';
import { crearDevolucion, terminarDevolucion } from '../../services/registros.service';
export default {
    name: 'ModalDevolucion',
    data() {
        return {
            fecha: '',
        }
    },
    mixins: [ modalFileMixin ],
    methods: {
        async crearDevolucion() {
            const formData = this.crearFormData();
            try {
                const response = await crearDevolucion(formData);
                const result = await response.json();
                if(response.status === 200) {
                    this.$store.dispatch('showSuccess', 'Se ha registrado la devolución del equipo correctamente');
                    this.$store.dispatch('setNewRegistro', result);
                    // Cierro el modal
                    this.$store.dispatch('closeModal');
                } else {
                    this.$store.dispatch('showError', result.error);
                }
            } catch( err ) {
                console.error(err);
                this.$store.dispatch('showError', 'Ah ocurrido un error al registrar la devolución. <br>Inténtelo más tarde');
            }
        },
        async terminarDevolucion() {
            const formData = this.crearFormData();
            try {
                const response = await terminarDevolucion(formData);
                const result = await response.json();
                if(response.status === 200) {
                    this.$store.dispatch('showSuccess', 'Se ha finalizado la devolución del equipo correctamente');
                    this.$store.dispatch('finalizarDevolucion', {
                        id_prestamo: formData.get('id_prestamo'),
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
                this.$store.dispatch('showError', 'Ah ocurrido un error al finalizar la devolución. <br>Inténtelo más tarde');
            }
        },
        cerrar() {
            this.$store.dispatch('closeModal');
        }
    },
};
</script>

<style>
.modal-devolucion {
    box-shadow: 0px 2px 25px 10px rgb(44, 168, 255, 0.2);
}
.modal-devolucion .modal-header .modal-title {
    background-color: #2ca8ff;
}
.modal-devolucion .form-control:focus {
    border: 1px solid #2ca8ff;
}
</style>
