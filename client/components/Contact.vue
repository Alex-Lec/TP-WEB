<template>
    <form>
        <h2>Bienvenue @user sur Confine'bay</h2>
        <img src=logo.png>
        <p>Content de vos achats, besoin d'une réponse à vos questions, réclamations sur un article ? <br><br>
            <strong> Vous êtes au bon endroit !</strong> <br><br>
            Ici vous pouvez écrire un message qui sera envoyé aux équipes du site en remplissant ce simple formulaire.
        </p>
        <div>
            <label for="email">Objet : </label>
            <input type="text" name="objet" placeholder="Objet du mail" size="50" required>
        </div>
        <div>
            <textarea
                type="text"
                placeholder="Votre mail ici"
                rows="20"
                cols="100"
                required>
            </textarea>
        </div>
        <button type="submit">Envoyer</button>
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