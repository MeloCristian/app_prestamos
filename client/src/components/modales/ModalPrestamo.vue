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
            <form>
                <div class="form-group">
                    <label>QR:</label>
                    <input type="text" v-model="qr" class="form-control" placeholder="QR - Equipo">
                </div>
                <div class="form-group">
                    <label>DNI Estudiante: <span id="message-dni"> {{ message_dni }} </span></label>
                    <input type="text" v-model="dni_estudiante" @keyup="validarDni" class="form-control" placeholder="DNI estudiante" />
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
                    <input type="file" id="archivo" @change="handleArchivo" class="form-control" accept="application/pdf">
                </div>

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
            <button type="button" class="btn btn-success" @click="realizarPrestamo" :disabled="!formCompleto">Realizar préstamo</button>
            <button type="button" class="btn btn-danger" @click="cerrar">Cancelar</button>
        </div>

    </div>

</template>

<script>
import { getAutocompletado, getComodatario } from '../../services/app.service';
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
            lugar_prestamo: '',
            message_dni: null,
            success_dni: false,

            data_camara : {
                file_foto: false,
                camara: false,
                // para capturar foto
                width: 400,
                height: 0,
                video: null,
                canvas: null,
                photo: null,
                capturar: null,
            },
            data_img: null 
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
        toggleCamara() {
            this.data_camara.camara = !this.data_camara.camara;
            if(this.data_camara.camara) {
                setTimeout( () => {
                    this.startCamara();
                }, 100);
            } else {
                this.stopCamara();
            }
        },
        startCamara() {
            let streaming = false;

            this.data_camara.video = document.getElementById('video');
            this.data_camara.canvas = document.getElementById('canvas');
            this.data_camara.photo = document.getElementById('photo');

            navigator.mediaDevices.getUserMedia({
                    video: true,
                    audio: false
                })
                .then( stream => {
                    this.data_camara.video.srcObject = stream;
                    this.data_camara.video.play();
                })
                .catch( err => {
                    this.$store.dispatch('showError', 'No se ha sido posible inicializar la cámara');
                    console.log("Ocurrio un error: " + err);
                });

            this.data_camara.video.addEventListener('canplay', () => {
                if (!streaming) {
                    this.data_camara.height = this.data_camara.video.videoHeight / (this.data_camara.video.videoWidth / this.data_camara.width);

                    if (isNaN(this.height)) {
                        this.data_camara.height = this.data_camara.width / (4 / 3);
                    }

                    this.data_camara.video.setAttribute('width', this.data_camara.width);
                    this.data_camara.video.setAttribute('height', this.data_camara.height);
                    this.data_camara.canvas.setAttribute('width', this.data_camara.width);
                    this.data_camara.canvas.setAttribute('height', this.data_camara.height);
                    streaming = true;
                }
            }, false);
        },
        stopCamara() {
            this.data_camara.video.srcObject.getTracks().forEach( (track) => {
                track.stop();
            });
            this.clearphoto();
        },
        clearphoto() {
            this.data_img = null;
        },
        takepicture() {
            let context = this.data_camara.canvas.getContext('2d');
            if (this.data_camara.width && this.data_camara.height) {
                this.data_camara.canvas.width = this.data_camara.width;
                this.data_camara.canvas.height = this.data_camara.height;
                context.drawImage(this.data_camara.video, 0, 0, this.data_camara.width, this.data_camara.height);

                this.data_img = this.data_camara.canvas.toDataURL('image/png');
            } else {
                this.clearphoto();
            }
        },
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
        async validarDni(e) {
            const dni = e.target.value
            const span = document.querySelector('#message-dni');
            if(dni.length > 6) {
                try {
                    const response = await getComodatario(dni);
                    const result = await response.json();
                    if(response.status === 200) {
                        e.target.classList.remove('danger');
                        span.classList.remove('text-danger');
                        span.classList.add('text-success');
                        this.message_dni = result.nombre;
                        this.success_dni = true;
                    } else {
                        e.target.classList.add('danger');
                        span.classList.remove('text-success');
                        span.classList.add('text-danger');
                        this.message_dni = result.error;
                        this.success_dni = false;
                    }
                } catch(error) {
                    console.error(error);
                    e.target.classList.add('danger');
                    this.message_dni = 'Estudiante no registrado en la base de datos';
                    this.success_dni = false;
                }
            } else {
                e.target.classList.remove('danger');
                this.message_dni = null;
                this.success_dni = false;
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
        handleFoto(e) {
            const files = e.target.files || e.dataTransfer.files;

            const spanError = document.querySelector('#error-foto');
            spanError.textContent = '';

            if (!files.length) {
                this.data_camara.file_foto = false;
                this.data_img = null;
                return;
            }

            let extFoto = files[0].name.split('.').pop();
            if(extFoto != 'png' && extFoto != 'jpg' && extFoto != 'jpeg') {
                e.target.classList.add('danger');
                spanError.textContent = 'Solo se permiten imágenes';
                this.data_camara.file_foto = false;
                this.data_img = null;
                return;
            } else {
                e.target.classList.remove('danger');
                this.data_camara.file_foto = true;

                var fr = new FileReader();
    
                fr.addEventListener("load", (e) => {
                    console.log(e.target.result);
                    this.data_img = e.target.result;
                }); 
                
                fr.readAsDataURL( files[0] );
            }
        },
        cerrar() {
            this.$store.dispatch('closeModal');
        }
    }
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
