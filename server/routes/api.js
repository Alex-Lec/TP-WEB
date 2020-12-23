const express = require('express')
const { route } = require('../app.js')
const router = express.Router()

const bcrypt = require('bcrypt')
const { Client } = require('pg')

const client = new Client({
 user: 'postgres',
 host: 'localhost',
 password: 'ino5C?r5E$I2Vc?%>r7Npj1]}<Tw{:',
 database: 'confinebay'
})

client.connect()

router.post('/register', (req, res) => {
	res.json({ message: "test" })
})

/*
async function isMailExist(email) {
	const sql = "SELECT * FROM Utilisateur WHERE email=$1"
	const result = await client.query({
			text: sql,
			values: [email]
	})
	return result.rowCount >= 1
}

router.post('/register', async (req, res) => {
	const prenom = req.body.prenom
	const nom = req.body.nom
	const email = req.body.email
	const password = req.body.password
	if (! isMailExist) {
			res.status(501).json({ message: "L'utilisateur existe déjà" })
	}
	const hash = await bcrypt.hash(password, 10)
	const sql = "INSERT INTO Utilisateur VALUES ($1, $2, $3, $4)"
	const result = await client.query({
			text: sql,
			values: [email, hash, prenom, nom]
	})
	if (result.rowCount === 1) {
			res.json({ message: "Vous êtes bien inscrit !"})
	}
	res.status(501).json({ message: "Erreur lors de l'inscription"})
})
*/

module.exports = router
