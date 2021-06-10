<template>
    <div class="modal-content modal-comodato">
        <div class="modal-header">
            <h5 class="modal-title">
                <img src="@/assets/img/foto.svg" width="40" height="40"/> Cargar evidencia fotográfica
            </h5>
            <button type="button" @click="cerrar" class="close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
        <div class="modal-body">
            <p class="text-center">A continuación, tiene la opción de subir el archivo imágen de la evidencia o puede realizar el registro fotográfico utilizando la cámara web.</p>
            <form>
                <div class="form-group">
                    <label>Foto: <span id="error-foto" class="text-danger"></span></label>
                    <input type="file" id="foto" @change="handleFoto" :disabled="data_camara.camara" class="form-control" accept="image/png, image/jpeg">
                </div>
                
                <div class="text-center">
                    <button v-if="!data_camara.camara" @click.prevent="toggleCamara" type="button" :disabled="data_camara.file_foto" class="btn btn-success">Activar camara</button>
                    <button v-else type="button" @click.prevent="toggleCamara" class="btn btn-danger">Desactivar camara</button>
                </div>

                <div v-if="data_camara.camara" class="foto-evidencia animate__animated animate__fadeIn animate__fast">
                    <div class="camera">
                        <video id="video">Video no disponible</video>
                        <button id="capturar" @click.prevent="takepicture" v-if="!data_img" class="btn btn-success">Tomar foto</button>
                        <button v-else @click.prevent="clearphoto" class="btn btn-danger">Eliminar</button>
                    </div>     
                    <canvas id="canvas" style="display:none;"></canvas>
                    <div class="output">
                        <img id="photo" v-if="data_img" :src="data_img" class="animate__animated animate__fadeIn animate__fast" alt="Vista de la foto"> 
                    </div>
                </div>
            </form>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-primary" @click="cargarEvidencia" :disabled="!formCompleto">Cargar evidencia</button>
            <button type="button" class="btn btn-danger" @click="cerrar">Cancelar</button>
        </div>
    </div>
</template>

<script>
import modalFileMixin from '@/mixins/modalFileMixin';
import modalEvidenciaMixin from '@/mixins/modalEvidenciaMixin';
import { uploadEvidencia } from '../../services/prestamos.service';

export default {
    name: 'ModalComodato',
    mixins: [ modalFileMixin, modalEvidenciaMixin ],
    created() {
        this.archivo = true;
    },
    methods: {
        async cargarEvidencia() {
            const formData = this.crearFormData();
            if(formData) {
                this.$store.dispatch('showLoading');
                try {

                    let object = {};
                    formData.forEach((value, key) => object[key] = value);
                    let dataJson = JSON.stringify(object);

                    const response = await uploadEvidencia( dataJson );
                    const result = await response.json();
                    this.$store.dispatch('hideLoading');
                    if(response.status === 200) {
                        this.$store.dispatch('showSuccess', result.message);
                        const nombreEvidencia = `${formData.get('qr')}_${formData.get('dni_estudiante')}_${formData.get('id_prestamo')}.png`;
                        this.$store.dispatch('updateEvidenciaPrestamo', { 
                            id_prestamo: formData.get('id_prestamo'), 
                            evidencia: nombreEvidencia
                        });
                        this.$store.dispatch('closeModal');
                    } else {
                        this.$store.dispatch('showError', result.error);
                    }
                } catch(error) {
                    console.error(error);
                    this.$store.dispatch('showError', 'Error inesperado al cargar la evidencia.<br>Inténtelo más tarde.');
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

<style scoped>
.foto-evidencia {
    width: 100%;
    /* padding: 10px; */
    position: relative;
}
.foto-evidencia .camera,
.foto-evidencia .output {
    width: 100%;
    display: flex;
    position: relative;
}
.foto-evidencia .camera video,
.foto-evidencia .output img {
    display: block;
    width: 100%;
    max-width: 400px;
    margin: 10px auto;
    height: auto;
}
.foto-evidencia .output img {
    border: 2px solid #06446b;
    box-shadow: 0px 0px 20px 10px rgba(0, 0, 0, .2);
}
.foto-evidencia .camera button {
    position: absolute;
    left: 42%;
    bottom: 10px;
    padding: 3px 5px;
    opacity: 0.7;
    z-index: 9;
    transition: .3s ease all;
}
.foto-evidencia .camera button:hover {
    opacity: 1;
}
.foto-evidencia .output {
    position: absolute;
    top: 0;
    left: 0;
}   
</style>
