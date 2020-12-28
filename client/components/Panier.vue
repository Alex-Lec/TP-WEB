<template>
<div>
    <h2>Bienvenue {{ user.data }} dans votre panier</h2>
    <p>Vous pouvez ici cliquer sur le bouton "payer" pour nous donner moult argent !</p>
    <div class="panier-container">
        <div class="article-panier" v-for="article in panier.data" :key="article.id">
            <div class="panier-article-img">
                <img :src="article.img" alt="image article">
            </div>
            <div class="panier-article-description">
                <h3>{{ article.titre }}</h3>
                <div class="prix-u">Prix unitaire : {{ article.prix }}€</div>
                <div class="quantity">
                    Quantité :
                    <input type="text" pattern="[0-9]" name="qty-input" id="qty-input" :value="article.articleQty">
                    <button @click="incrementQty(article.articleQty)"> + </button>
                    <button> - </button>
                </div>
                <div class="prix-t">Prix total : {{ article.prix * article.articleQty }}€</div>
            </div>
            <div class="modif-article">
                <button @click="editArticle(article)">Modifier</button>
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
            panier: { type: Object },
            editingArticle: { type: Object }
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
        getPrixTotal(prix, quantity) {
            return prix * quantity
        },
        incrementQty(articleQty) {
            const result = articleQty++
            console.log(result)
            return result
        },
        editArticle(article) {
            this.editingArticle = article
        }
    }
}
</script>

<style scoped>
</style>