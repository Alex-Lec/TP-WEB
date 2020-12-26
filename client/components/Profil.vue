<template>
    <form @submit.prevent="changeProfil">
        <h2>Modifier vos informations</h2>
        <p>Ancien email : {{ user.data.email }} </p>
        <input type="email" name="email" id="email" placeholder="Nouvelle adresse mail" required autofocus v-model="modifUser.email">
        <input type="password" name="password" id="password" placeholder="Nouveau mot de passe" required v-model="modifUser.password">
        <button type="submit">Modifier</button>
    </form>
</template>

<script>
module.exports = {
    props: {
        user: { type: Object }
    },
    data() {
        return {
            modifUser: {
                email: '',
                password: ''
            }
        }
    },
    methods: {
        changeProfil() {
            this.$emit("change-profil", this.modifUser)
        }
    }
}
</script>

<style scoped>

</style>