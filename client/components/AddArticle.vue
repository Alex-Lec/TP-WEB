<template>
  <form @submit.prevent="addArticle">
    <h2>Nouveau produit à ajouter</h2>
    <input
      type="text"
      v-model="newArticle.name"
      placeholder="Nom du produit"
      required
    />
    <input
      type="text"
      v-model="newArticle.marque"
      placeholder="Marque du produit"
      required
    />
    <textarea type="text" v-model="newArticle.description" required></textarea>
    <input
      type="text"
      v-model="newArticle.image"
      placeholder="Lien vers l'image"
    />
    <input
      type="number"
      v-model="newArticle.price"
      placeholder="Prix"
      required
    />
    <button type="submit">Ajouter</button>
  </form>
</template>
 
<script>
module.exports = {
    props: {
		  user: { type: Object }
	},
  data() {
    return {
		newArticle: {
        name: '',
        marque: '',
        description: '',
        image: '',
        price: 0
      }
	};
  },
  methods: {
	  addArticle () {
      this.$emit('add-article', this.newArticle)
    }
  },
};
</script>