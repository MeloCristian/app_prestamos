<template>
    <div class="modal-content modal-prestamo">
        <div class="modal-header">
            <h5 class="modal-title prestamo">
                <img src="@/assets/img/prestamo.svg" width="40" height="40"/> Préstamo de equipos
            </h5>
            <button type="button" @click="cerrar" class="close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
        <div class="modal-body">
            <!-- <p class="text-center">Préstamo de equipos</p> -->
            <form>
                <div class="form-group">
                    <label>QR:</label>
                    <!-- <input type="text" v-if="datosModal.qr" :value="datosModal.qr" disabled class="form-control" placeholder="QR - Equipo"> -->
                    <input type="text" v-model="qr" class="form-control" placeholder="QR - Equipo">
                </div>
                <div class="form-group">
                    <label>DNI Estudiante:</label>
                    <input type="text" v-model="dni_estudiante" class="form-control" placeholder="DNI estudiante" />
                </div>
                <div class="form-group">
                    <input list="funcionarios" v-model="dni_funcionario" class="form-control" placeholder="DNI funcionario">
                    <datalist id="funcionarios">
                        <option v-for="(funcionario, index) in infoAutocompletado.funcionarios" :key="index" :value="funcionario.cedula">{{ funcionario.nombre }}</option>
                    </datalist>
                </div>
                <div class="form-group">
                    <label>Fecha prestamo:</label>
                    <input type="date" v-model="fecha_inicio" class="form-control" />
                </div>
                <div class="form-group">
                    <label>Lugar prestamo:</label>
                    <!-- <div class="form-control">Pasto</div> -->
                    <select class="form-control" v-model="lugar_prestamo">
                        <option value="">Lugar préstamo...</option>
                        <option v-for="(sede, index) in infoAutocompletado.sedes" :key="index" :value="sede.id_sede">{{ sede.sede }}</option>
                    </select>
                </div>
                <div class="form-group">
                    <label>Comodato: <span id="error-archivo" class="text-danger"></span></label>
                    <input type="file" id="archivo" @change="handleArchivo" class="form-control">
                </div>
            </form>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-success" @click="realizarPrestamo" :disabled="!formCompleto">Realizar préstamo</button>
            <button type="button" class="btn btn-danger" @click="cerrar">Cancelar</button>
        </div>
    </div>
</template>

<script>
import { getAutocompletado } from '../../services/app.service';
import { createPrestamo } from '../../services/prestamos.service';
import modalFileMixin from '@/mixins/modalFileMixin';

export default {
    name: 'ModalPrestamo',
    mixins: [modalFileMixin],
    data() {
        return {
            qr: null,
            dni_estudiante: null,
            dni_funcionario: null,
            fecha_inicio: null,
            lugar_prestamo: ''
        }
    },
    computed: {
        infoAutocompletado() {
            return this.$store.state.info_autocompletado;
        }
    },
    created() {
        this.qr = this.datosModal.qr;

        if(!Object.entries(this.infoAutocompletado).length){
            this.getInfoAutocompletado();
        }
    },
    methods: {
        async getInfoAutocompletado() {
            // Obtengo la informacion de sedes y funcionarios para poder hacer un auticompletado de los inputs
            this.$store.dispatch('showLoading');
            try {
                const response = await getAutocompletado();
                const result = await response.json();
                this.$store.dispatch('hideLoading');
                if(response.status === 200) {
                    this.$store.dispatch('setInfoAutocompletado', result);
                }
            } catch(error) {
                console.error(error);
            }
        },
        async realizarPrestamo() {
            const formData = this.crearFormData();
            if(formData) {
                this.$store.dispatch('showLoading');
                try {
                    const response = await createPrestamo(formData);
    
                    const result = await response.json();
                    this.$store.dispatch('hideLoading');
                    if(response.status === 200) {
                        this.$store.dispatch('showSuccess', 'Préstamo realizado correctamente');
                        this.$store.dispatch('setNewPrestamo', result);
                        this.$store.dispatch('closeModal');
                    } else {
                        this.$store.dispatch('showError', result.error);
                    }
                } catch(error) {
                    console.error(error);
                    this.$store.dispatch('showError', 'Error inesperado al resalizar el préstamo.<br>Inténtelo más tarde.');
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
.modal-prestamo {
    box-shadow: 0px 2px 25px 10px rgb(81, 197, 75, 0.2);
}
.modal-prestamo .modal-header .modal-title {
    background-color: #51c54b;
}
.modal-prestamo .form-control:focus {
    border: 1px solid #51c54b;
}
</style>
