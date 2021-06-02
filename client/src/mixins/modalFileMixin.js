export default {
    data() {
        return {
            archivo: false
        }
    },
    computed: {
        formCompleto() {
            for (const key in this.$data) {
                if(!this.$data[key]) {
                    return false;
                }
            }
            return true;
        },
        datosModal() {
            return this.$store.state.modal.datos_modal;
        }
    },
    methods: {
        handleArchivo(e) {
            const files = e.target.files || e.dataTransfer.files;

            const spanError = document.querySelector('#error-archivo');
            spanError.textContent = '';

            if (!files.length) {
                this.archivo = false;
                return;
            }

            let extArchivo = files[0].name.split('.').pop();
            if(extArchivo != 'pdf') {
                e.target.classList.add('danger');
                spanError.textContent = 'Solo archivos PDF';
                this.archivo = false;
                return;
            } else {
                e.target.classList.remove('danger');
                this.archivo = true;
            }
        },
        crearFormData() {
            if(!this.formCompleto) {
                this.$store.dispatch('showError', 'Debe completar todos los campos.');
                return false;
            }

            const file = document.querySelector('input[type="file"]').files[0];

            if(!file) {
                this.$store.dispatch('showError', 'No ha seleccionado ningún archivo');
                return false;
            }

            const formData = new FormData();

            // Obtengo los datos de la data del componente
            for (const key in this.$data) {
                if(key != 'archivo') {
                    if(this.$data[key]) {
                        formData.append(key, this.$data[key]);
                    }
                }
            }

            // Obtengo los datos del modal
            for (const key in this.datosModal) {
                if(this.datosModal[key]) {
                    if(!formData.has(key)) {
                        formData.append(key, this.datosModal[key]);
                    }
                }
            }

            formData.append('archivo_pdf', file);

            return formData;
        }
    }
};
