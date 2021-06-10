export default {
    data() {
        return {
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
    computed: {},
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
    }
};
