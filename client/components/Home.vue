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
        <div class="form-admin" v-show="checkUser()">
            <add-article @add-article="addArticle" v-show="showForm" class="article-form"></add-article>
            <button @click="changeViewButton()" v-show="showButton">Afficher le formulaire</button>
            <button @click="doneForm()" v-show="! showButton" id="close-button">Fermer</button>
        </div>
    </div>
</div>
</template>

<script>
const AddArticle = window.httpVueLoader('./components/AddArticle.vue')
module.exports = {
    components: {
        AddArticle
    },
    props: {
        user: { type: Object }
    },
    data() {
        return {
            articles: { type : Object },
            showForm: false,
            showButton: true
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
        },
        changeViewButton() {
            this.showForm = ! this.showForm
            this.showButton = ! this.showButton
        },
        doneForm() {
            this.showForm = false
            this.showButton = true
        },
        checkUser() {
            if (this.props === undefined) {
                return false
            } else if (this.user === undefined) {
                return true
            }
            return false
        }
    }
}
</script>

<style scoped>
    #close-button {
        margin-top: 5px;
        width: 100%;
    }
</style>