<template>
    <div class="articles-container">
        <div v-for="article in articles.data" :key="article.id" class="article">
            <img :src="article.img" alt="image article">
            <div class="two-article-content">
                <h3>{{ article.titre }}</h3>
                <div class="price">{{ article.prix }}€</div>
            </div>
            <div class="two-article-content">
                <div class="marque">{{ article.marque }}</div>
                <div class="btn-panier"><button @click="addPanier(article.id)">Ajouter au panier</button></div>
            </div>
            <div>{{ article.description }}</div>
        </div>
        <add-article @add-article="addArticle" :show="showForm"></add-article>
        <button @click="showForm = !showForm" v-show="showbutton">Afficher le formulaire</button>
    </div>
</template>

<script>
const AddArticle = window.httpVueLoader('./components/AddArticle.vue')
module.exports = {
    components: {
        AddArticle
    },
    data() {
        return {
            articles: { type : Object },
            showForm: false,
            showbutton: true
        }
    },
    async mounted() {
        try {
            this.articles = await axios.get('/api/articles')
        } catch (err) {
            return console.error('network error', err)
        }
    },
    methods: {
        addPanier(articleId) {
            this.$emit('add-panier', articleId)
        },
        addArticle (article) {
            this.$emit('add-article', article)
        }
    }
}
</script>

<style scoped>

</style>