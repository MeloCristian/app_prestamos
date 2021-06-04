<template>
    <div class="login animate__animated animate__fadeIn animate__fast">
        <div class="modal-content modal-comodato">
            <div class="modal-header">
                <h5 class="modal-title">
                    <img src="@/assets/img/login.svg" width="40" height="40"/> Iniciar sesión
                </h5>
            </div>

            <form @submit.prevent="login">
                <div class="modal-body">
                    <p class="text-center">Ingrese el usuario y contraseña correspondientes</p><br>
                        <div class="form-group">
                            <label>Usuario: </label>
                            <input type="text" class="form-control" name="user" v-model="user">
                        </div>
                        <div class="form-group">
                            <label>Contraseña: </label>
                            <input type="password" class="form-control" v-model="password">
                        </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary" :disabled="!user || !password">Iniciar sesión</button>
                </div>
            </form>
        </div>
    </div>
</template>

<script>
import { login } from '../services/app.service';
export default {
    name: 'Login',
    data() {
        return {
            user: null,
            password: null
        }
    },
    methods: {
        async login() {
            const data = {
                user: this.user,
                password: this.password
            }


            this.$store.dispatch('showLoading');
            console.log('Iniciar sesión');
            try {
                const response = await login( JSON.stringify(data) );
                const result = await response.json();
                this.$store.dispatch('hideLoading');
                if(response.status === 200) {
                    localStorage.setItem('token', result.token);
                    this.$router.push( { name: 'Home' } );
                } else {
                    this.$store.dispatch('showError', result.error);
                }
            } catch( err ) {
                console.error(err);
                this.$store.dispatch('showError', 'No se ha podido iniciar sesión.<br> Inténtelo más tarde');
            }
        }
    },
};
</script>

<style scoped>
.login .modal-content {
    width: 95%;
    margin: 2rem auto;
    max-width: 500px;
    box-shadow: 0px 0px 30px 5px rgba(0, 0, 0, .2);
}
</style>
