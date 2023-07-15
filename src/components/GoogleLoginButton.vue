<template>
  <button class="google-login-button" @click="loginWithGoogle">
    <img src="/google-logo.png" alt="Google Logo" />
    <span>Iniciar sesión con Google</span>
  </button>
</template>

<script>
export default {
  methods: {
    loginWithGoogle() {
        window.location.href = "http://localhost:8080/oauth2/authorization/google";
      }
  }
}
</script>

<style scoped>
.google-login-button {
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 10px;
  background-color: #fff;
  border: 1px solid #ccc;
  border-radius: 4px;
  cursor: pointer;
}

.google-login-button img {
  width: 20px;
  height: 20px;
  margin-right: 10px;
}

.google-login-button span {
  font-size: 14px;
}
</style>
