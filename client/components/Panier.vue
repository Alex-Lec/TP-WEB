<template>
<div>
    <h2>Bienvenue {{ user.data.prenom }} {{ user.data.nom }} dans votre panier</h2>
    <p>Vous pouvez ici cliquer sur le bouton "payer" pour nous donner moult argent !</p>
    <div class="panier-container">
        <div class="article-panier" v-for="article in panier.data.rows" :key="article.id">
            <div>
                {{ article.email }}
            </div>
        </div>
    </div>
</div>
</template>

<script>
module.exports = {
    props: {
        user: { type: Object },
    },
    data() {
        return {
            panier: { type: Object }
        }
    },
    async mounted() {
        try {
            this.panier = await axios.get('/api/panier')
        } catch (err) {
            return console.error('network error', err)
        }
    },
    methods: {

    }
}
</script>

<style scoped>
    div {
        text-align: center;
        margin-top: 30px;
    }
</style>