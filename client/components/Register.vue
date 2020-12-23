<template>
    <form @submit.prevent="register">
        <h2>Créer un compte</h2>
        <input type="text" name="prenom" id="prenom" v-model="user.prenom" placeholder="Prénom" required autofocus>
        <input type="text" name="nom" id="nom" v-model="user.nom" placeholder="Nom" required>
        <input type="mail" name="email" id="email" v-model="user.email" placeholder="Adresse mail" required>
        <input type="password" name="password" id="password" v-model="user.password" placeholder="Mot de passe" required>
        <button type="submit"><router-link id="lien" to="/">Créer un compte</router-link></button>
    </form>
</template>

<script>
module.exports = {
    data() {
        return {
            user: {
                prenom: '',
                nom: '',
                email: '',
                password: ''
            }
        }
    },
    methods: {
        register() {
            this.$emit('register', this.user)
        }
    }
}
</script>

<style scoped>

</style>