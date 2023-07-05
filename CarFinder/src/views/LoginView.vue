<script setup>
</script>

<template>
  <div class="LoginPage">
    <div class="row">
      <div class="col-md-6 offset-md-3">
        <div>
          <h1>Login Page</h1>
          <hr />
        </div>
        <form class="login-form">
          <div class="form-group">
            <label>Email</label>
            <input type="text" class="form-control" />
          </div>
          <div class="form-group">
            <label>Password</label>
            <input type="text" class="form-control" />
          </div>

          <div class="my-3">
            <button type="submit" class="btn btn-primary">
             Login
            </button>
          </div>
        </form>
      </div>
    </div>
  </div>
</template>

<style lang="scss" scoped>
  .LoginPage{
    position: relative;
    display: flex;
    justify-content: center;
    top: 10rem;
  }

</style>