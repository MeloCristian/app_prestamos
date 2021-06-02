<template>
    <div class="box box-info animate__animated animate__fadeInUp animate__faster">
        <span class="badge badge-info"><img src="@/assets/img/informacion.svg" width="40" height="40"/> Información</span>
        <div class="box-content">
            <div class="content info">
                <div class="row">
                    <h6>qr</h6>
                    <p>{{ info.qr }}</p>
                </div>
                <div class="row">
                    <h6>garantía</h6>
                    <p>{{ info.garantia | date }}</p>
                </div>
                <div class="row">
                    <h6>s/n</h6>
                    <p>{{ info.sn }}</p>
                </div>
                <div class="row">
                    <h6>s/n hdd 1</h6>
                    <p>{{ info.sn_disco1 }}</p>
                </div>
                <div class="row">
                    <h6>s/n hdd 2</h6>
                    <p>{{ info.sn_disco2 }}</p>
                </div>
                <div class="row">
                    <h6>responsable</h6>
                    <p>{{ info.sede_responsable }}</p>
                </div>
                <div class="row">
                    <h6>lote</h6>
                    <p>{{ info.id_lote }}</p>
                </div>
                <div class="row">
                    <h6>marca</h6>
                    <p>{{ info.marca }}</p>
                </div>
                <div class="row">
                    <h6>modelo</h6>
                    <p>{{ info.modelo }}</p>
                </div>
                <div class="row">
                    <h6>cpu</h6>
                    <p>{{ info.cpu }}</p>
                </div>
                <div class="row">
                    <h6>ram</h6>
                    <p>{{ info.ram }}</p>
                </div>
                <div class="row">
                    <h6>hdd</h6>
                    <p>{{ info.hdd }}</p>
                </div>
            </div>
            <div v-if="estadoActualPC == 1" class="opts-box">
                <button class="btn btn-success hint--top"
                        aria-label="Realizar préstamo"
                        @click="showModal">
                    <img src="@/assets/img/prestamo.svg" width="30" height="30"/>
                    <span>Préstamo</span>
                </button>
            </div>
        </div>
    </div>
</template>
<script>
export default {
    name: 'BoxInfo',
    props: ['info', 'estadoActualPC'],
    methods: {
        showModal() {
            this.$store.dispatch('showModal', { 
                show_modal: 'ModalPrestamo', 
                datos_modal: { 
                    qr: this.info.qr
                }
            });
        }
    },
};
</script>

<style></style>
