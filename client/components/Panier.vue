<template>
<div>
    <div class="panier-title" v-if="user.data !== undefined">
        <h2>Bienvenue {{ user.data.prenom }} {{ user.data.nom }} !</h2>
        <p>Vous pouvez ici cliquer sur le bouton "payer" pour nous donner moult argent !</p>
    </div>
    <div class="panier-title" v-else>
        <h2>Bienvenue dans votre panier</h2>
        <p>Connectez-vous pour pouvoir passser commande !</p>
    </div>
    <div class="panier-container">
        <div class="article-panier" v-for="article in panier.data" :key="article.id">
            <div class="panier-article-img">
                <img :src="article.img" alt="image article">
            </div>
            <div class="panier-article-description">
                <h3>{{ article.titre }}</h3>
                <div class="prix-u">Prix unitaire : {{ article.prix }}€</div>
                <div class="quantity">
                    Quantité : {{ article.articleQty }}
                </div>
                <div class="prix-t">Prix total : {{ article.prix * article.articleQty }}€</div>
            </div>
            <div class="modif-article">
                <button @click="editArticle(article)" v-if="editingArticle.id !== article.articleId">Modifier</button>
                <div class="editQty-container" v-else>
                    <input type="number" name="editQty" id="editQty" v-model="newQty">
                    <button @click="updateQuantity()">Mettre à jour</button>
                    <button @click="cancel()">Annuler</button>
                </div>
            </div>
        </div>
        <div class="resume" v-show="user.data !== undefined">
            Prix total : {{ getTotalPrice() }}€
            <router-link class="nav-link" id="lien" to="/payment"><button>Procéder au paiement</button></router-link>
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
            editingArticle: {
				id: -1,
                titre: '',
                quantity: -1,
				img: '',
				prix: -1,
				marque: ''
            },
            newQty: 1,
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
        editArticle(article) {
            this.editingArticle = {
                id: article.articleId,
                titre: article.titre,
                quantity: this.newQty,
				img: article.img,
				prix: article.prix,
				marque: article.marque
            }   
        },
        async updateQuantity() {
            this.editingArticle.quantity = this.newQty
            this.$emit('update-quantity', this.editingArticle)
            this.editingArticle = {
                id: -1,
                titre: '',
                quantity: -1,
				img: '',
				prix: -1,
				marque: ''
            }
            this.newQty = 1
            try {
                this.panier = await axios.get('/api/panier')
            } catch (err) {
                return console.error('network error', err)
            }
        },
        cancel() {
            this.editingArticle = {
                id: -1,
                titre: '',
                quantity: -1,
				img: '',
				prix: -1,
				marque: ''
            }
            this.newQty = 1
        },
        getTotalPrice() {
            var total = 0
            for (let i = 0; i < this.panier.data.length; i++) {
                let article = this.panier.data[i]
                total += parseInt(article.prix) * parseInt(article.articleQty)
            }
            return total
        }
    }
}
</script>

<style scoped>
    #editQty {
        width: 80px;
    }
</style>