import Vue from "vue";
import VueRouter from "vue-router";

Vue.use(VueRouter);

const routes = [
    {
        path: "/",
        name: "Home",
        component: () => import(/* webpackChunkName: "home" */ "../views/Home.vue"),
        meta: {
            requiresToken: true
        }
    },
    {
        path: "/login",
        name: "Login",
        component: () => import(/* webpackChunkName: "login" */ "../views/Login.vue"),
        meta: {
            requiresToken: false
        }
    },
    {
        path: '*',
        redirect: {
            name: 'Home'
        }
    }
];

const router = new VueRouter({
    mode: "history",
    base: process.env.BASE_URL,
    routes,
});

router.beforeEach((to, from, next) => {
    if (to.meta.requiresToken && !localStorage.getItem("token")) {
        next({ name: "Login" });
    } else if(!to.meta.requiresToken && localStorage.getItem("token")) {
        next({ name: "Home" });
    } else {
        next();
    }
});

export default router;
