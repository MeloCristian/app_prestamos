<template>
    <div class="card animate__animated animate__fadeInUp animate__faster">
        <div class="card-body">
            <div class="box box-summary animate__animated animate__fadeInUp animate__faster">
                <span class="badge badge-summary"><img src="@/assets/img/summary.svg" width="40" height="40"/> Información</span>
                <div class="box-content">
                    <div class="content summary">
                        <div class="row primary">
                            <h6>
                                <img src="@/assets/img/informacion.svg" width="35" height="35"/>
                                total equipos
                            </h6>
                            <p>{{ summary.equipos }}</p>
                        </div>
                        <div class="row success">
                            <h6>
                                <img src="@/assets/img/prestamo.svg" width="35" height="35"/>
                                prestamos realizados
                            </h6>
                            <p>{{ summary.prestamos }}</p>
                        </div>
                        <div class="row warning">
                            <h6>
                                <img src="@/assets/img/revision.svg" width="35" height="35"/>
                                total revisiones
                            </h6>
                            <p>{{ summary.revisiones }}</p>
                        </div>
                        <div class="row info">
                            <h6>
                                <img src="@/assets/img/devolucion.svg" width="35" height="35"/>
                                total devoluciones
                            </h6>
                            <p>{{ summary.devoluciones }}</p>
                        </div>
                        <div class="row success">
                            <h6>
                                <img src="@/assets/img/check.svg" width="35" height="35"/>
                                equipos disponibles
                            </h6>
                            <p>{{ summary.disponibles }}</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import { getSummary } from '../services/app.service';

export default {
    name: 'AppSummary',
    data() {
        return {
            summary: {
                equipos: 0,
                prestamos: 0,
                disponibles: 0,
                revisiones: 0,
                devoluciones: 0
            }
        }
    },
    created() {
        this.getInfoSummary();
    },
    methods: {
        async getInfoSummary() {
            this.$store.dispatch('showLoading');
            try {
                const response = await getSummary();
                const result = await response.json();
                this.$store.dispatch('hideLoading');
                if(response.status === 200) {
                    this.summary = result;
                } else {
                    this.$store.dispatch('showError', 'No se ha podido obtener el resumen general.<br> Inténtelo más tarde');
                }
            } catch(err) {
                console.error(err);
                this.$store.dispatch('showError', 'Error al obtener el resumen general');
            }
        }
    },
};
</script>

<style scoped>
.content.summary .row {
    width: 47%;
}

.content.summary .row h6,
.content.summary .row p {
    display: flex;
    align-items: center;
}

.content.summary .row h6 img {
    margin-right: 5px;
}

.content.summary .row.success {
    border-color: #51c54b;
}
.content.summary .row.success h6 {
    background-color: #51c54b;
}
.content.summary .row.warning {
    border-color: #ffb236;
}
.content.summary .row.warning h6 {
    background-color: #ffb236;
}
.content.summary .row.info {
    border-color: #2ca8ff;
}
.content.summary .row.info h6 {
    background-color: #2ca8ff;
}
.content.summary .row.primary {
    border-color: #06446b;
}
.content.summary .row.primary h6 {
    background-color: #06446b;
}
@media (max-width: 700px) {
    .content.summary .row {
        width: 95%;
    }
}
</style>
