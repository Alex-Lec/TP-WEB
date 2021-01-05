<template>
<form @submit.prevent="payment">
    <h1>Paiement</h1>
    <input type="text" name="card-num" id="card-num" placeholder="Numéro de carte">
    <datetime v-model="date"></datetime>
</form>
</template>

<script>
import { Datetime } from 'vue-datetime/src/Datetime.vue'
import 'vue-datetime/dist/vue-datetime.css'
module.exports = {
    components: {
        Datetime
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