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
                <div class="btn-panier"><button>Ajouter au panier</button></div>
            </div>
            <div>{{ article.description }}</div>
        </div>
    </div>
</template>

<script>
module.exports = {
    data() {
        return {
            articles: { type : Object }
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

    }
}
</script>

<style scoped>

</style>