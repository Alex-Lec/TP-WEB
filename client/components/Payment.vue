<template>
    <form @submit.prevent="pay" class="card-form">
        <h1>Paiement</h1>
        <div class="card-form">
            <div class="num-input">
                <label for="card-num">Numéro de la carte : </label>
                <input type="text" name="card-num" id="card-num" pattern="[0-9]{16}" placeholder="4970 ...">
            </div>
            <div class="date-input">
                <label for="card-date">Date d'expiration de la carte : </label>
                <input type="number" name="card-num" min="1" max="31" placeholder="Mois">
                <input type="number" name="card-num" min="1900" max="2100" placeholder="Année">
            </div>
            <div class="cvc-input">
                <label for="card-crypto">Crypogramme de la carte : </label>
                <input type="text" name="card-num" pattern="[0-9]{3}" placeholder="CVC">
            </div>
            <input type="submit" value="Payer" class="submit">
        </div>
    </form>
</template>

<script>
module.exports = {
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