<template>
  <Questions v-slot="{ manageQuestions }">
    <div v-show="!manageQuestions">
      <img class="not-permission" src="../assets/notPermission.png">
      <h1>Esta página solo es visible para usuarios autenticados</h1>
    </div>
  </Questions>
  
  

</template>

<script>
import Questions from '../components/Questions.vue'

export default {
  components: {Questions},
};
</script>

<style lang="scss" scoped>
.not-permission {
  margin-top: 20rem;
  margin-left: 20rem;
  width: 200px;
  height: 200px;
}
</style>