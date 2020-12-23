<template>
    <form @submit.prevent="contact">
        <h2>Bienvenue @user sur Confine'bay</h2>
        <img src="../assets/img/logo.png">
        <p>Content de vos achats, besoin d'une réponse à vos questions, réclamations sur un article ?
            <strong>Vous êtes au bon endroit !</strong>
            Ici vous pouvez écrire un message qui sera envoyé aux équipes du site en remplissant ce simple formulaire.
        </p>
        <div>
            <label for="email">Objet : </label>
            <input type="text" name="objet" placeholder="Objet du mail" size="50" required>
        </div>
        <textarea
            type="text"
            placeholder="Votre mail ici"
            rows="20"
            cols="100"
            required>
        </textarea>
        <button type="submit">Envoyer</button>
    </form>
</template>

<style scoped>
    strong {
        display: block;
    }
</style>