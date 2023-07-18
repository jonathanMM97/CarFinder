<template>
  <Questions v-slot="{ isLoading, manageQuestions }">
    <div v-show="!manageQuestions">
      <img class="not-permission" src="../assets/notPermission.png">
      <h1>Esta pagina solo es visible para usuarios autenticados</h1>
    </div>
    <div class="load" v-show="true">
      <img class="rim-image" src="../assets/rim.png">
    </div>
  </Questions>
  
  

</template>

<script>
import Questions from '../components/Questions.vue'
import Loading from '../components/Loading.vue'

export default {
  components: {Questions, Loading},
  data() {
    return {
      isLoading: false,
    }
  },
};
</script>

<style lang="scss" scoped>

.load {
    position: fixed;
    width: 300px;
    height: 300px;
    top: 40%;
    left: 40%;
}

.rim-image {
    position: absolute;
    width: 100%;
    height: 100%;
    animation: rotate 10s linear infinite;
}

@keyframes rotate {
    0% {
        transform: rotate(0deg);
    }

    100% {
        transform: rotate(360deg);
    }
}
.not-permission {
  margin-top: 20rem;
  margin-left: 20rem;
  width: 200px;
  height: 200px;
}
</style>