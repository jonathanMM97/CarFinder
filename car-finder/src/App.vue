<template>
  <header class="top-bar spread">
    <nav id="top-bar-nav" class="top-bar-nav">
      <figure>
        <img id="car-finder-logo" href="/" alt="CarFinderLogo" src="../src/assets/logo.png">
      </figure>
      <router-link to="/" class="top-bar-link">
        <i class="icofont-spoon-and-fork"></i>
        <span>Home</span>
      </router-link>

      <router-link to="/products" class="top-bar-link">
        <span>Products</span>
      </router-link>

      <router-link to="/pastOrders" class="top-bar-link">
        <span>Past-Orders</span>
      </router-link>
    </nav>
  </header>
  <router-view/>
</template>
