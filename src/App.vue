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
  width: 100%;
  height: 100%;
  align-items: center;
  font-family: 'Montserrat', sans-serif;
}
</style>
