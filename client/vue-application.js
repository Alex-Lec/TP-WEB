const Home = window.httpVueLoader('./components/Home.vue')
const Panier = window.httpVueLoader('./components/Panier.vue')
const Login = window.httpVueLoader('./components/Login.vue')

const routes = [
    { path: '/', component: Home },
    { path: '/panier', component: Panier },
    { path: '/login', component: Login }
]

const router = new VueRouter({
    routes
})

var app = new Vue({
    router,
    el: '#app',
    data: {

    },
    async mounted() {

    },
    methods: {

    }
})