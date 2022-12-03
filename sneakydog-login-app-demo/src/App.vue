<template>
    <div>
        <input v-model="loginRef.username"/>&nbsp;
        <input v-model="loginRef.password"/>&nbsp;
        <button @click="doLogin">Login</button>
    </div>
</template>

<script setup lang="ts">
// This starter template is using Vue 3 <script setup> SFCs
// Check out https://vuejs.org/api/sfc-script-setup.html#script-setup
import HelloWorld from './components/HelloWorld.vue'
import {ref} from "vue";
import axios, {isCancel, AxiosError} from 'axios';

const loginRef = ref({
    username: 'user',
    password: 'password'
})

let  doLogin = async () => {
    console.log(loginRef.value.password)
    var data = {
        username: loginRef.value.username,
        password: loginRef.value.password
    };

    await axios.postForm('/login', data, {
        headers: {'content-type': 'application/x-www-form-urlencoded'}
    })

}



</script>

<style scoped>

</style>
