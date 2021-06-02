import Vue from "vue";
import App from "./App.vue";
import router from "./router";
import store from "./store";

Vue.config.productionTip = false;

// SweetAlert2
import VueSweetalert2 from 'vue-sweetalert2';
import 'sweetalert2/dist/sweetalert2.min.css';
Vue.use(VueSweetalert2);

// Filtro para mostrar la fecha de la garantia corectamente
import { format } from 'date-fns'
Vue.filter('date', function (value) {
    if (!value) return ' - - - '
    return format(new Date(value), 'dd-MM-yyyy')
});

// Variable global - URL del servidor
import { API_URI } from "./services/config";
Vue.prototype.$api = API_URI;

new Vue({
    router,
    store,
    render: (h) => h(App),
}).$mount("#app");
