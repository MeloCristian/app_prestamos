<template>
    <div class="home container animate__animated animate__fadeIn animate__faster">
        <!-- <h2 class="text-center">Sistema de gestión para el prestamo de computadores de la Universidad de nariño</h2> -->
        <div class="principal-buttons">
            <button class="btn btn-success hint--bottom"
                        aria-label="Realizar préstamo"
                        @click="showModal('ModalPrestamo')">
                <img src="@/assets/img/prestamo.svg" width="30" height="30"/>
                <span>Préstamo</span>
            </button>
            <button v-if="!summary"
                    class="btn btn-primary hint--bottom animate__animated animate__fadeIn animate__faster"
                        aria-label="Mostrar resumen"
                        @click="showSummary">
                <img src="@/assets/img/summary.svg" width="30" height="30"/>
                <span>Información</span>
            </button>

            <img class="btn-logout" @click="cerrarSesion" src="@/assets/img/logout.svg" width="45" height="45" />

        </div>

        <form @submit.prevent="consultarQR">
            <h4 class="text-center">QR a consultar</h4>
            <div class="input-qr">
                <input type="text" class="form-control" v-model="qr" placeholder="Digite el QR del equipo a consultar" autofocus />
                <button type="submit" class="btn btn-primary btn-round" :disabled="!qr">Consultar</button>
            </div>
        </form>
        <template v-if="logged">
                <template v-if="!infoVacia && !summary">
                    <AppCard />
                </template>
                <template v-if="infoVacia && allInfo.informacion && !summary">
                    <div class="alerta alerta-error text-center animate__animated animate__fadeInUp animate__faster">No se encontro información relacionada a su consulta</div>
                </template>

                <template v-if="summary">
                    <AppSummary />
                </template>
        </template>
    </div>
</template>

<script>
import { getAll, isLogged } from '../services/app.service';

export default {
    name: "Home",
    data() {
        return {
            qr: null,
            summary: true,
            logged: false
        }
    },
    computed: {
        allInfo() {
            return this.$store.state.all_info;
        },
        infoVacia() {
            let empty = false;
            if(Object.entries(this.allInfo).length === 0) {
                empty = true;
            } else {
                if(!this.allInfo['informacion'].length && !this.allInfo['prestamos'].length && !this.allInfo['registros'].length) {
                    empty = true;
                }
            }
            return empty;
        }
    },
    async beforeCreate() {
        try {
            const response = await isLogged();
            const result = await response.json();
            if(response.status === 200) {
                this.logged = true;
            } else {
                localStorage.removeItem('token');
                this.$router.push( { name: 'Login' } );
                this.$store.dispatch('showError', result.error);
            }
        } catch(error) {
            console.error(error);
            localStorage.removeItem('token');
            this.$router.push( { name: 'Login' } );
            this.$store.dispatch('showError', 'Hay un error con la sesión actual. <br> Inicie sesión nuevamente');
        }
    },
    created() {
        // console.log(Object.entries(this.all_info).length === 0)
    },
    methods: {
        showSummary() {
            this.summary = true;
        },
        async consultarQR() {
            //Cuando se quiera consultar lo que hago es elimianr los caracteres especiones del qr
            this.qr = this.qr.replace(/[&/\\#,+()$~%.'":*?<>{}]/g, '');

            if(!this.qr) return
            this.$store.dispatch('showLoading');
            try {
                const response = await getAll(this.qr);
                const result = await response.json();
                this.$store.dispatch('hideLoading');
                if(response.status === 200) {
                    this.summary = false;
                    this.$store.dispatch('setAllInfo', result);
                } else {
                    this.$store.dispatch('showError', 'No ha sido obtener la información deseada.<br> Inténtelo más tarde');
                }
            } catch(error) {
                console.error(error);
                this.$store.dispatch('showError', 'Error inesperado. <br> Inténtelo más tarde');
            }
        },
        showModal(modal) {
            this.$store.dispatch('showModal', { show_modal: modal });
        },
        cerrarSesion() {
            localStorage.removeItem('token');
            this.$router.push( { name: 'Login' } )
        }
    },
    components: {
        AppCard: () => import(/* webpackChunkName: "appCard" */ "../components/card/AppCard"),
        AppSummary: () => import(/* webpackChunkName: "appSummary" */ "../components/AppSummary")
    }
};
</script>

<style scoped>
.principal-buttons {
    position: relative;
    max-width: 750px;
    margin: 0 auto;
    display: flex;
    justify-content: center;
    align-items: center;
}
.principal-buttons button {
    display: flex;
    align-items: center;
    padding: 10px 16px;
}
.principal-buttons button img {
    margin-right: 5px;
}
.principal-buttons .btn-logout {
    display: block;
    position: absolute;
    right: 0;
    opacity: .7;
    cursor: pointer;
    transition: .3s ease all;
}
.principal-buttons .btn-logout:hover {
    opacity: 1;
    transform: scale(1.1);
}
form h4 {
    margin-top: 10px;
}
form {
    max-width: 500px;
    margin: 0 auto 1.7rem auto;
}
.input-qr {
    position: relative;
}
.input-qr input {
    padding-right: 120px;
    font-weight: 700;
    text-align: center;
}
.input-qr .btn {
    position: absolute;
    top: -9px;
    right: -3px;
    padding: 12px 20px;
    border-radius: 0 30px 30px 0;
    font-weight: 700;
}
@media (max-width: 600px) {
    .content.summary .row {
        width: 100%;
    }
}
@media (max-width: 400px) {
    .principal-buttons button span {
        display: none;
    }
    .principal-buttons button img {
        margin-right: 0;
    }
}
</style>
