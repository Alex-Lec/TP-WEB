<template>
    <form @submit.prevent="contact" class="log-form">
        <div class="panier-title" v-if="user.data !== undefined">
            <h2>Bienvenue {{ user.data.prenom }} {{ user.data.nom }} sur Confine'bay!</h2>
        </div>
        <div class="panier-title" v-else>
            <h2>Bienvenue sur Confine'bay!</h2>
        </div>
        <img src="../assets/img/logo.png">
        <p>Content de vos achats, besoin d'une réponse à vos questions, réclamations sur un article ?
            <strong>Vous êtes au bon endroit !</strong>
            Ici vous pouvez écrire un message qui sera envoyé aux équipes du site en remplissant ce simple formulaire.
        </p>
        <div>
            <label for="email">Objet : </label>
            <input type="text" name="objet" v-model="mail.object" placeholder="Objet du mail" size="50" id="objet" required>
        </div>
        <textarea type="text" v-model="mail.contenu" placeholder="Votre mail ici" rows="20" cols="100" id="corps" required>
        </textarea>
        <button type="submit" @click="envoyerMail()">Envoyer</button>
    </form>
</template>


<script>
module.exports = {
    props: {
        user: { type: Object }
    },
    data() {
        return {
            mail: {
                object: '',
                contenu: ''
            }
        }
    },
    methods: {
        envoyerMail() {
            window.location.href = 'mailto:alexislecuyer14@gmail.com?subject=' + this.mail.object + '&body=' + this.mail.contenu
        }
    }
}
</script>

<style scoped>
    strong {
        display: block;
    }
</style>