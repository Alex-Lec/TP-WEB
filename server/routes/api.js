const express = require('express')
const { route } = require('../app.js')
const router = express.Router()

const bcrypt = require('bcrypt')
const { Client } = require('pg')

const client = new Client({
	user: 'postgres',
	host: 'localhost',
	password: 'ino5C?r5E$I2Vc?%>r7Npj1]}<Tw{:',
	database: 'ConfinEbay'
})

client.connect()

async function isEmailExist(email) {
	const sql = "SELECT COUNT(*) FROM public.\"User\" WHERE email=$1"
	const result = await client.query({
		text: sql,
		values: [email]
	})
	return result >= 1
}

router.post('/register', async (req, res) => {
	const email = req.body.email
	const password = req.body.password
	const prenom = req.body.prenom
	const nom = req.body.nom

	if (isEmailExist(email)) {
		res.status(501).json({ message: "L'utilisateur existe déjà" })
	}

	const hash = await bcrypt.hash(password, 10)
	const sql = "INSERT INTO public.\"User\" (email, password, prenom, nom) VALUES ($1, $2, $3, $4)"
	const result = await client.query({
		text: sql,
		values: [email, hash, prenom, nom]
	})
	res.json({ message: 'Vous êtes bien inscrit !' })	
})

module.exports = router