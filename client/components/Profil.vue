<template>
    <form>
        <h2 class="form-item">Modifier vos informations</h2>
        <br>

        <div class="form-item">
            <p>Ancien email : ceci est une adresse email </p>
        </div>
        <div class="form-item">
            <label for="email">Nouvel email : </label>
            <input type="email" name="email" id="email" placeholder="Adresse mail">
        </div>

        <div class="form-item">
            <label for="password">Nouveau mot de passe : </label>
            <input type="password" name="password" id="password" placeholder="Mot de passe">
        </div>
        <br>

        <div class="form-item">
            <button type="submit">Modifier</button>
        </div>
    </form>
</template>

<style scoped>
    form {
        text-align: center;
    }
    h2 {
        margin-top: 2%;
        margin-bottom: 2%;
    }
    input {
        margin-bottom: 2%;
    }
    p {
        margin-bottom: 2%;
    }
    text-area {
        max-width: 280px;
    }
    img {
        margin-bottom: 2%;
    }
    button {
        margin-top: 2%;
        width: 10%;
        height: 10%;
    }
</style>