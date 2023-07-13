<script setup>
import { RouterLink, RouterView } from 'vue-router'
import TheNavigation from './components/TheNavigation.vue';
</script>

<template>
  <TheNavigation />
  <div class="main">
    <router-view></router-view>
  </div>
  
</template>

<style scoped>

.main{
  align-items: center;
  font-family: 'Montserrat', sans-serif;
  margin-top: 12%;
}
</style>
