<script setup>
import GoogleLoginButton from '@/components/GoogleLoginButton.vue';

</script>

<template>
  <div v-show="false" class="LoginPage">
        <h1>Login</h1>
        <form class="login-form">

          <div class="form-control">
            <input type="text" required/>
            <span></span>
            <label>Email</label>
          </div>

          <div class="form-control">
            <input type="password" required/>
            <span></span>
            <label class="text-label">Password</label>
          </div>

          <div class="pass">
            <router-link class="pass__link" to="/login">Forgot Password?</router-link>
          </div>

          <input type="submit" value="Login">

          <div class="signup">
            Not a member? <router-link class="signup__link" to="/signup">Signup</router-link>
          </div>
        </form>
  </div>
  <div class="login">
    <GoogleLoginButton />
  </div>
</template>

<style lang="scss" scoped>

  .login{
    position: fixed;
    top: 50%;
    left: 50%;
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