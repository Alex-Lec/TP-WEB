<template>
    <form @submit.prevent="contact" class="log-form">
        <h2>Bienvenue @user sur Confine'bay</h2>
        <img src="../assets/img/logo.png">
        <p>Content de vos achats, besoin d'une réponse à vos questions, réclamations sur un article ?
            <strong>Vous êtes au bon endroit !</strong>
            Ici vous pouvez écrire un message qui sera envoyé aux équipes du site en remplissant ce simple formulaire.
        </p>
        <div>
            <label for="email">Objet : </label>
            <input type="text" name="objet" placeholder="Objet du mail" size="50" id="objet" required>
        </div>
        <textarea type="text" placeholder="Votre mail ici" rows="20" cols="100" id="corps" required>
        </textarea>
        <button type="submit" @click="envoyermail()">Envoyer</button>
    </form>
</template>


<script>
module.exports = {
    props: {
        user: { type: Object }
    },
    data() {
        return {
            envoyermail : {
            }
        }
    },
    methods: {
        envoyermail() {
            var $sendEmailEl = $('#send-email');
            var $subjectEl = $('#objet');
            var $bodyEl = $('#corps');
            function updateEmailLink() {
                $sendEmailEl.attr('href', 'mailto:grossepoubelle225@gmail.com?' + 'subject=' + encodeURIComponent($subjectEl.val()) + '&body=' + encodeURIComponent($bodyEl.val()));
                }
            $('#objet,#corps').on('input', updateEmailLink);
            updateEmailLink();
        }
    }
}
</script>

<style scoped>
    strong {
        display: block;
    }
</style>