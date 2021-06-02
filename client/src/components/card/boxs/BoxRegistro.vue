<template>
    <div>
        <div v-for="(registro, index) in registros" :key="index" 
            class="box animate__animated animate__fadeInUp animate__fast" 
            :class="{ 'box-warning' : registro.id_proceso == 1, 'box-primary': registro.id_proceso == 2}">
            <span class="badge"
                  :class="{ 'badge-warning' : registro.id_proceso == 1, 'badge-primary': registro.id_proceso == 2}">
                
                <img v-if="registro.id_proceso == 1" src="@/assets/img/revision.svg" width="40" height="40"/>
                <img v-if="registro.id_proceso == 2" src="@/assets/img/devolucion.svg" width="40" height="40"/>
                {{ registro.proceso }}
            </span>
            <div class="box-content">
                <div class="content prestamo"
                     :class="{ 'warning' : registro.id_proceso == 1, 'primary': registro.id_proceso == 2}">
                    <div class="row">
                        <h6>qr</h6>
                        <p>{{ registro.qr }}</p>
                    </div>
                    <div class="row">
                        <h6>inicio</h6>
                        <p>{{ registro.fecha_inicio | date }}</p>
                    </div>
                    <div class="row">
                        <h6>fin</h6>
                        <p>{{ registro.fecha_fin | date }}</p>
                    </div>
                    <div class="row">
                        <h6>proceso</h6>
                        <p>{{ registro.proceso }}</p>
                    </div>
                    <div class="row">
                        <h6>descripcion</h6>
                        <p>{{ registro.descripcion }}</p>
                    </div>
                    <div class="row">
                        <h6>soporte</h6>
                        <p v-if="registro.pdf_soporte">
                            <a v-if="registro.id_proceso == 1" :href="$api+'revisiones/'+registro.pdf_soporte" target="_blank"><img src="@/assets/img/pdf.svg" width="23" height="23"/> Ver formato</a>
                            <a v-if="registro.id_proceso == 2" :href="$api+'devoluciones/'+registro.pdf_soporte" target="_blank"><img src="@/assets/img/pdf.svg" width="23" height="23"/> Ver formato</a>
                            </p>
                        <p v-else><a><img src="@/assets/img/nocomodato.svg" width="23" height="23"/> Sin formato</a></p>
                    </div>
                </div>

                <div class="opts-box">
                    <button @click="terminarRevision(registro)"
                            v-if="!registro.fecha_fin && registro.id_proceso == 1" 
                            class="btn hint--top btn-warning" 
                            aria-label="Terminar revisión">
                        <img src="@/assets/img/check.svg" width="30" height="30"/>
                        <span>Terminar</span>
                    </button>

                    <button @click="terminarDevolucion(registro)"
                            v-if="!registro.fecha_fin && registro.id_proceso == 2" 
                            class="btn hint--top btn-info" 
                            aria-label="Finalizar devolución">
                        <img src="@/assets/img/check2.svg" width="30" height="30"/>
                        <span>Aprobar</span>
                    </button>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
export default {
    name: 'BoxRegistro',
    props: ['id_prestamo'],
    computed: {
        registros() {
            const allRegistros = JSON.parse(JSON.stringify(this.$store.state.all_info.registros));
            const registros = allRegistros.filter( r => r.id_prestamo == this.id_prestamo);
            return registros;
        }
    },
    methods: {
        terminarRevision(registro){
            this.$store.dispatch('showModal', { show_modal: 'ModalGarantia', 
                datos_modal: {
                    id_registro: registro.id_registro,
                    id_prestamo: registro.id_prestamo,
                    qr: registro.qr,
                    fin_proceso: true
                }
            });
        },
        terminarDevolucion(registro) {
            this.$store.dispatch('showModal', { show_modal: 'ModalDevolucion', 
                datos_modal: {
                    id_registro: registro.id_registro,
                    id_prestamo: registro.id_prestamo,
                    qr: registro.qr,
                    fin_proceso: true
                }
            });
        }
    },
};
</script>

<style></style>
