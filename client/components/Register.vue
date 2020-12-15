<template>
    <form @submit.prevent="connect">
        <h2 class="form-item">Créer un compte</h2>
        <div class="form-item">
            <label for="email">Email : </label>
            <input type="email" name="email" id="email" v-model="user.email" placeholder="Adresse mail" required autofocus>
        </div>
        <div class="form-item">
            <label for="password">Mot de passe : </label>
            <input type="password" name="password" id="password" v-model="user.password" placeholder="Mot de passe" required>
        </div>
        <div class="form-item">
            <button type="submit">S'enregistrer</button>
            <button><router-link id="lien" to="/register">Créer un compte</router-link></button>
        </div>
    </form>
</template>

<script>
module.exports = {
    data() {
        return {
            user: {
                email: '',
                password: ''
            }
        }
    },
    methods: {
        connect() {
            this.$emit('register', this.user)
        }
    }
}
</script>

<style scoped>
    form {
        display: flex;
        flex-direction: column;
        justify-content: space-evenly;
        align-items: center;
        align-content: center;
        height: 250px;
    }

    input {
        padding: 2px;
    }

    button {
        padding: 2px;
    }
</style>