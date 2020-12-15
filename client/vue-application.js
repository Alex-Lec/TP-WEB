const Home = window.httpVueLoader('./components/Home.vue')
const Panier = window.httpVueLoader('./components/Panier.vue')
const Login = window.httpVueLoader('./components/Login.vue')
const Contact = window.httpVueLoader('./components/Contact.vue')
const Profil = window.httpVueLoader('./components/Profil.vue')

const routes = [
    { path: '/', component: Home },
    { path: '/panier', component: Panier },
    { path: '/login', component: Login },
    { path: '/contact', component: Contact },
    { path: '/profil', component: Profil }
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