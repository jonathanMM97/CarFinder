<template>
    <div class="Signup-Page">
      <div class="row">
        <div class="col-md-6 offset-md-3">
          <div>
            <h1>Signup Page</h1>
            <hr />
          </div>
          <form class="signup-form">
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
                Signup
              </button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </template>

<style lang="scss" scoped>
.Signup-Page {
  position: relative;
  display: flex;
  justify-content: center;
  top: 10rem;
}
</style>