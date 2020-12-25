const Home = window.httpVueLoader('./components/Home.vue')
const Panier = window.httpVueLoader('./components/Panier.vue')
const Login = window.httpVueLoader('./components/Login.vue')
const Contact = window.httpVueLoader('./components/Contact.vue')
const Profil = window.httpVueLoader('./components/Profil.vue')
const Register = window.httpVueLoader('./components/Register.vue')

const routes = [
  { path: '/', component: Home },
  { path: '/panier', component: Panier },
  { path: '/login', component: Login },
  { path: '/contact', component: Contact },
  { path: '/profil', component: Profil },
  { path: '/register', component: Register }
]

const router = new VueRouter({
  routes
})

var app = new Vue({
  router,
  el: '#app',
  data: {
    connected: false,
    user: { type: Object },
    panier: {
      createdAt: null,
      updatedAt: null,
      articles: []
    }
  },
  async mounted() {
    try {
      this.user = await axios.get('/api/me')
      this.connected = true
    } catch (err) {
      return console.error('network error', err)
    }
  },
  methods: {
    showMenu() {
      var nav = document.querySelector(".nav-link")
    },
    async register(user) {
      try {
        await axios.post('/api/register', 'email=' + user.email + '&password=' + user.password + '&prenom=' + user.prenom + '&nom=' + user.nom)
        window.location.href = 'http://localhost:3000/login'
      } catch (err) {
        return console.error('network error', err)
      }
    },
    async connect(user) {
      try {
        await axios.post('/api/login', 'email=' + user.email + '&password=' + user.password)
        this.user = await axios.get('/api/me')
        this.connected = true
        window.location.href = 'http://localhost:3000'
      } catch (err) {
        return console.error('network error', err)
      }
    }
  }
})