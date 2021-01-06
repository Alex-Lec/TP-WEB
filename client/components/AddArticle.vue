<template>
  <form @submit.prevent="addArticle">
    <h2>Nouveau produit à ajouter</h2>
    <input
      type="text"
      v-model="newArticle.titre"
      placeholder="Nom du produit"
      required
    />
    <input
      type="text"
      v-model="newArticle.marque"
      placeholder="Marque du produit"
      required
    />
    <textarea type="text" v-model="newArticle.description" placeholder="Description" required></textarea>
    <input
      type="text"
      v-model="newArticle.img"
      placeholder="Lien vers l'image"
    />
    <input
      type="text"
      v-model="newArticle.prix"
      pattern="[0-9]*"
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
          titre: '',
          marque: '',
          description: '',
          img: '',
          prix: ''
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