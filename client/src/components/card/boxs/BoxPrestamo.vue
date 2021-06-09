<template>
    <div>
        <div v-if="prestamos.error" class="alerta alerta-error" style="margin:2rem auto;">{{ prestamos.error }}</div>
        <div v-else class="container-prestamo animate__animated animate__fadeInUp animate__faster" v-for="(prestamo, index) in prestamos" :key="index">
            <div class="box box-success">
                <span class="badge badge-success"><img src="@/assets/img/prestamo.svg" width="40" height="40"/> Préstamo</span>
                <div class="box-content">
                    <div class="content prestamo success">
                        <div class="row">
                            <h6>qr</h6>
                            <p>{{ prestamo.qr }}</p>
                        </div>
                        <div class="row">
                            <h6>dni est.</h6>
                            <p>{{ prestamo.cedula_estudiante }}</p>
                        </div>
                        <div class="row">
                            <h6>estudiante</h6>
                            <p>{{ prestamo.estudiante }}</p>
                        </div>
                        <div class="row">
                            <h6>código</h6>
                            <p>{{ prestamo.codigo }}</p>
                        </div>
                        <div class="row">
                            <h6>dni func.</h6>
                            <p>{{ prestamo.cedula_funcionario }}</p>
                        </div>
                        <div class="row">
                            <h6>funcionario</h6>
                            <p>{{ prestamo.funcionario }}</p>
                        </div>
                        <div class="row">
                            <h6>inicio</h6>
                            <p>{{ prestamo.fecha_inicio | date }}</p>
                        </div>
                        <div class="row">
                            <h6>fin</h6>
                            <p>{{ prestamo.fecha_fin | date }}</p>
                        </div>
                        <div class="row">
                            <h6>lugar</h6>
                            <p>{{ prestamo.lugar_prestamo }}</p>
                        </div>
                        <div class="row">
                            <h6>comodato</h6>
                            <p v-if="prestamo.comodato"><a :href="$api+'soportes/comodatos/'+prestamo.comodato" target="_blank"><img src="@/assets/img/pdf.svg" width="23" height="23"/> Ver comodato</a></p>
                            <p v-else><a><img src="@/assets/img/nocomodato.svg" width="23" height="23"/> Sin comodato</a></p>
                        </div>
                        <div class="row foto">
                            <p v-if="prestamo.evidencia"><a :href="$api+'soportes/evidencias/'+prestamo.evidencia" target="_blank"><img :src="$api+'soportes/evidencias/'+prestamo.evidencia" class="foto_evidencia" width="150" height="150"/></a></p>
                            <p v-else><a><img src="@/assets/img/foto.svg" width="40" height="40"/> Sin evidencia</a></p>
                        </div>
                    </div>
                    <div class="opts-box">
                        <button class="btn btn-primary hint--top" aria-label="Cargar comodato"
                                @click="modalComodato(prestamo)">
                            <img src="@/assets/img/pdf.svg" width="30" height="30"/>
                            <span>Comodato</span>
                        </button>
                        <button v-if="!prestamo.fecha_fin && estadoActualPC != 3 && estadoActualPC != 4" 
                                class="btn btn-warning hint--top" 
                                aria-label="Nueva revisión"
                                @click="modalGarantia(prestamo)">
                            <img src="@/assets/img/revision.svg" width="30" height="30"/>
                            <span>Revisión</span>
                        </button>
                        <button v-if="!prestamo.fecha_fin && estadoActualPC != 4" 
                                class="btn btn-info hint--top" 
                                aria-label="Crear devolución"
                                @click="modalDevolucion(prestamo)">
                            <img src="@/assets/img/devolucion.svg" width="30" height="30"/>
                            <span>Devolución</span>
                        </button>
                    </div>
                </div>
            </div>
            <BoxRegistro :id_prestamo="prestamo.id_prestamo" />
        </div>
    </div>
</template>
<script>
export default {
    name: 'BoxPrestamo',
    props:['estadoActualPC'],
    computed: {
        prestamos() {
            return this.$store.state.all_info.prestamos;
        }
    },
    methods: {
        modalComodato(prestamo) {
            this.$store.dispatch('showModal', { 
                show_modal: 'ModalComodato', 
                datos_modal: {
                    id_prestamo: prestamo.id_prestamo,
                    qr: prestamo.qr,
                    dni_estudiante: prestamo.cedula_estudiante
                }
            });
        },
        modalGarantia(prestamo) {
            this.$store.dispatch('showModal', { show_modal: 'ModalGarantia', 
                datos_modal: {
                    id_prestamo: prestamo.id_prestamo, 
                    qr: prestamo.qr,
                }
            });
        },
        modalDevolucion(prestamo) {
            this.$store.dispatch('showModal', { show_modal: 'ModalDevolucion', 
                datos_modal: {
                    id_prestamo: prestamo.id_prestamo, 
                    qr: prestamo.qr,
                }
            });
        }
    },
    components: {
        BoxRegistro: () => import(/* webpackChunkName: "boxInfo" */ "./BoxRegistro")
    }
};
</script>

<style>
.container-prestamo {
    margin: 15px auto;
    padding: 5px 10px;
    box-shadow: 0 5px 7px 3px rgb(0 0 0 / 20%);
}
</style>

<style scoped>
.row.foto {
    border: none;
    justify-content: center;
    align-items: center;
}
.row.foto p img{
    width: 35px;
}
.row.foto .foto_evidencia {
    width: 250px;
    /* box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, .3); */
    border: 1px solid #858585;
    border-radius: 10px;
}
</style>
