

<template>
  <div class="home">
    <div class="home__welcome">
      <img src="../assets/logo.png">
      <h1>Welcome to CarFinder</h1>
    </div>
    <div class="container">
      <router-link class="btn btn-primary-1" to="/login">Login</router-link>
      <router-link class="btn btn-primary-2" to="/signup">Signup</router-link>
    </div>
  </div>
</template>

<style lang="scss" scoped>
.home{
  width: 30%;
  position: absolute;
  top: 50%;
  left: 50%;
  right: 50%;
  transform: translate(-50%, -50%);

  &__welcome {
    img{
      width: 100px;
      border-radius: 40%;
      position: relative;
      left: 25%;
    }
  }

  .container{
    .btn{
      border: 1px solid rgba(0, 0, 0, 0.8);
      background: none;
      padding: 10px 20px;
      top: 4rem;
      left: 10%;
      font-size: 20px;
      font-family: 'Montserrat';
      text-decoration: none;
      cursor: pointer;
      margin: 10px;
      border-radius: 10%;
      transition: 0.8s;
      position: relative;
      overflow: hidden;
      color: rgba(0, 0, 0, 0.8);
    }

    .btn-primary-1:hover,
    .btn-primary-2:hover{
      background: rgba(0, 0, 0, 0.8);
      color: white;
    }
  }
}
</style>