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
    props: {
        articles: { type: Object }
    },
    data() {
        return {

        }
    },
    methods: {

    }
}
</script>

<style scoped>

</style>