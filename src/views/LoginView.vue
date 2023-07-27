<script setup>
import GoogleLoginButton from '@/components/GoogleLoginButton.vue';

</script>

<template>
  <div class="login">
    <GoogleLoginButton />
  </div>
</template>

<style lang="scss" scoped>

  .login {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh; /* Ajusta la altura al 100% de la ventana */
  }


  .LoginPage {
    position: absolute;
    top: 50%;
    left: 50%;
    right: 50%;
    transform: translate(-50%, -50%);
    width: 400px;
    border-radius: 10%;

    h1 {
      text-align: center;
      padding: 0 0 20px 0;
      border-bottom: 1px solid rgba(0, 0, 0, 0.8);
    }

    form {
      padding: 0 40px;
      box-sizing: border-box;
    }

    .form-control {
      position: relative;
      border-bottom: 2px solid #fff;
      margin: 30px 0;

      input {
        width: 100%;
        padding: 0 5px;
        height: 40px;
        font-size: 16px;
        border: none;
        background: none;
        outline: none
      }

      label {
        position: absolute;
        top: 50%;
        left: 5px;
        color: rgba(0, 0, 0, 0.8);
        transform: translateY(-50%);
        font-size: 16px;
        pointer-events: none;
        transition: 0.5s;
      }

      span::before {
        content: '';
        position: absolute;
        top: 40px;
        left: 0;
        width: 0;
        height: 2px;
        background: rgba(0, 0, 0, 0.8);
        transition: 0.5s;
      }

      input:focus ~ label,
      input:valid ~ label{
        top: -5px;
        color: rgba(0, 0, 0, 0.8);
      }

      input:focus ~ span::before,
      input:valid ~ span::before{
        width: 100%;
      }
    }

    .pass{
      margin: -5px 0 20px 5px;
      color: #adadad;
      cursor: pointer;
      
      &__link {
        text-decoration: none;
      }
    }
    .pass:hover{
      color: blue;
      text-decoration: underline;
    }

    input[type="submit"] {
      width: 100%;
      height: 50%;
      border: 1px solid;
      background: rgba(0, 0, 0, 0.8);
      border-radius: 25px;
      font-size: 18px;
      color: #ffffff;
      font-weight: 700;
      cursor: pointer;
      outline: none;
    }

    input[type="submit"]:hover{
      border-color: #ffffff;
      transition: 0.5s;
    }

    .signup {
      margin: 30px 0;
      text-align: center;
      font-size: 16px;
      color: rgba(0, 0, 0, 0.8);

      &__link {
        text-decoration: none;
      }
    }

    .signup__link:hover {
      text-decoration: underline;
    }
  }

</style>