<template>
	<form @submit.prevent="connect">
		<h2>Connexion</h2>
		<input
			type="email"
			name="email"
			id="email"
			v-model="user.email"
			placeholder="Adresse mail"
			required
			autofocus
		/>
		<input
			type="password"
			name="password"
			id="password"
			v-model="user.password"
			placeholder="Mot de passe"
			required
		/>
		<button type="submit">Se connecter</button>
		<div>
			Pour vous créer un compte c'est par ici :
			<router-link id="lien" to="/register"><button>S'enregistrer</button></router-link>
		</div>
	</form>
</template>

<script>
module.exports = {
	data() {
		return {
			user: {
				email: '',
				password: '',
			},
		};
	},
	methods: {
		connect() {
			this.$emit("connect", this.user);
		},
	},
};
</script>

<style scoped>

</style>
