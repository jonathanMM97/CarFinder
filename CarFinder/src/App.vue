<script setup>
import { RouterLink, RouterView } from 'vue-router'
import TheNavigation from './components/TheNavigation.vue';
</script>

<template>
  <div class="main">
    <TheNavigation />
    <router-view></router-view>
  </div>
  
</template>

<style scoped>

.main{
  align-items: center;
  font-family: 'eMontserrat', 'Montserrat', sans-serif;
}
</style>
