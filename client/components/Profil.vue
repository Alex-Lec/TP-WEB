<template>
    <form>
        <h2>Modifier vos informations</h2>
        <p>Ancien email : {{ user.data.email }} </p>
        <input type="email" name="email" id="email" placeholder="Nouvelle adresse mail" required autofocus>
        <input type="password" name="password" id="password" placeholder="Nouveau mot de passe" required>
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

        }
    },
    methods: {

    }
}
</script>

<style scoped>

</style>