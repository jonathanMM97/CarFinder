<template>
  <div class="send">
    <button @click="sendAnswer" class="btn btn__link">Terminar</button>
  </div>
</template>

<script>
import axios from 'axios'
export default {
  methods: {
    async sendAnswer() {
      try {
        const response = await axios.get('http://localhost:8080/question', { withCredentials: true });
        console.log(response.data);
      } catch (error) {
        console.error(error);
      }
    },
  },
};
</script>

<style lang="scss" scoped>
</style>