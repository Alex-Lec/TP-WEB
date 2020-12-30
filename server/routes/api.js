const express = require('express')
const { route } = require('../app.js')
const router = express.Router()
const bcrypt = require('bcrypt')
const { Client } = require('pg')

const client = new Client({
	user: 'postgres',
	host: 'localhost',
	password: 'mdpsecret',
	database: 'PROJET-WEB'
})

client.connect()

async function isEmailExist(email) {
	const sql = "SELECT * FROM public.\"User\" WHERE email=$1"
	const result = await client.query({
		text: sql,
		values: [email]
	})
	return result.rowCount >= 1
}

async function isPasswordCorrect(email, password) {
	const sql = "SELECT password FROM public.\"User\" WHERE email=$1"
	const result = await client.query({
		text: sql,
		values: [email]
	})
	return await bcrypt.compare(password, result.rows.pop().password)
}

async function getUserId(email) {
	const sql = "SELECT id FROM public.\"User\" WHERE email=$1"
	const result = await client.query({
		text: sql,
		values: [email]
	})
	return result.rows.pop().id
}

router.post('/register', async (req, res) => {
	const email = req.body.email
	const password = req.body.password
	const prenom = req.body.prenom
	const nom = req.body.nom
	const mailExist = await isEmailExist(email)

	if (mailExist) {
		res.status(401).json({ message: "L'utilisateur existe déjà" })
	} else {
		const hash = await bcrypt.hash(password, 10)
		const sql = "INSERT INTO public.\"User\" (email, password, prenom, nom) VALUES ($1, $2, $3, $4)"
		const result = await client.query({
			text: sql,
			values: [email, hash, prenom, nom]
		})
		res.json({ message: 'Vous êtes bien inscrit !' })	
	}
})

router.post('/login', async (req, res) => {
	const email = req.body.email
	const password = req.body.password
	const passwordCorrect = await isPasswordCorrect(email, password)
	if (passwordCorrect) {
		const id = await getUserId(email)
		if (req.session.userId === id) {
			res.status(401).json({ message: "Vous êtes déjà connecté !" })
		} else {
			req.session.userId = id
			res.json({ message: "Vous êtes connecté" })
		}
	} else {
		res.status(401).json({ message: "Mot de passe incorrect !" })
	}
})

router.get('/articles', async (req, res) => {
	const sql = "SELECT * FROM public.\"Article\""
	const result = await client.query({
		text: sql		
	})
	res.json(result.rows)
})

router.get('/me', async (req, res) => {
	const id = req.session.userId
	if (id !== undefined) {
		const sql = "SELECT prenom, nom, email FROM public.\"User\" WHERE id=$1"
		const result = await client.query({
			text: sql,
			values: [id]
		})
		res.json(result.rows[0])
	} else {
		res.status(401).json({ message: "Vous n'êtes pas connecté !" })
	}
})

router.patch('/profil', async (req, res) => {
	const id = req.session.userId
	const email = req.body.email
	const password = req.body.password
	if (id !== undefined) {
		const hash = await bcrypt.hash(password, 10)
		const sql = "UPDATE public.\"User\" SET email=$1, password=$2 WHERE id=$3"
		const result = await client.query({
			text: sql,
			values: [email, hash, id]
		})
		res.json({ message: "Vos informations ont été modifiées !" })
	} else {
		res.status(401).json({ message: "Vous n'êtes pas connecté !" })
	}
})

router.get('/panier', async (req, res) => {
	const id = req.session.userId
	try {
		const sql = 'SELECT "userId", "articleId", "articleQty", a."titre", a."prix", a."marque", a."img" FROM public."Panier" p INNER JOIN public."User" u ON u.id=$1 INNER JOIN public."Article" a ON a.id = p."articleId"'
		const result = await client.query({
			text: sql,
			values: [id]
		})
		res.json(result.rows)
	} catch (err) {
		res.status(401).json({ message: err })
	}
})

router.patch('/panier', async (req, res) => {
	const userId = req.session.userId
	const articleId = req.body.articleId
	const quantity = req.body.quantity
	console.log(userId)
	console.log(articleId)
	console.log(quantity)
	try {
		const sql = 'UPDATE public."Panier" SET "articleQty"=$1 WHERE "articleId"=$2 AND "userId"=$3'
		const result = await client.query({
			text: sql,
			values: [quantity, articleId, userId]
		})
	} catch (err) {
		res.status(401).json({ message: err })
	}
})

module.exports = router