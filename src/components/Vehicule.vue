<template>
  <div v-show="showProducts" class="show">
    <div v-show="showNavSearch" class="nav-search">
      <button @click="llamada" class="more-questions">
        <img class="plus" src="../assets/add.png">
        Nuevas preguntas
      </button>
      <button @click="changevisible" class="hide-slidebar">
        <span class="material-symbols-outlined">
          dock_to_right
        </span>
      </button>
    </div>
    <div v-show="!showNavSearch" class="hide-navSearch">
      <button @click="changevisible" class="hide-slidebar">
        <span class="material-symbols-outlined">
          dock_to_right
        </span>
      </button>
    </div>
    <div class="product" v-show="!newCarousel">
      <a v-for="vehiculo in vehicules" :key="vehiculo.id" :href="vehiculo.link" class="product" target="_blank">
        <div class="product-container">
          <img class="item" :src="vehiculo.image">
          <div class="product__info">
            <h1>{{ vehiculo.title }}</h1>
            <h2>{{ vehiculo.price.toLocaleString('en', { useGrouping: true, minimumFractionDigits: 0, maximumFractionDigits: 0, minimumIntegerDigits: 1 }) }} €</h2>
          </div>
        </div>
      </a>
    </div>

  </div>
</template>

<script>

export default {
  props:['vehicules', 'showCarouselAgain', 'showProducts', 'addIteration'],
  data() {
    return {
      showNavSearch: true,
      isVisible: true,
      currentSlides: null,
      newCarousel: false,
    }
  },
  methods: {
    llamada() {
      this.addIteration();
      this.showCarouselAgain();
    },
    changevisible() {
      this.showNavSearch = !this.showNavSearch;
    }
  }
};
</script>

<style lang="scss" scoped>

.show {
  display: flex;
  margin-top: 6.7rem;
  gap: 10px;
}


/* Barra lateral izquierda */
.nav-search {
  flex: 0 0 300px; /* Ancho fijo de la barra lateral */
  padding: 10px; /* Espaciado interno */
  background-color: rgba(0, 0, 0, 0.1); /* Color de fondo de la barra lateral */
  border-right: 1px solid rgba(0, 0, 0, 0.2);
  margin-left: -10px;
}

.nav-search button {
  display: inline-block; /* Muestra los botones uno al lado del otro */
  margin-right: 10px; /* Espacio de 10px entre los botones (ajusta según tus preferencias) */
  vertical-align: middle; /* Alinea verticalmente los elementos del botón */
}

.hide-navSearch {
  flex: 0 0 50px;
  padding: 10px;
  background: transparent;


  button {
    width: 100%;
  }
}

/* Contenedor de productos */
.product {
  flex: 1; /* El contenedor de productos ocupará el espacio restante */
  display: flex;
  flex-wrap: wrap;
  justify-content: flex-start; /* Alinea los productos al inicio */
  color: black
}

.product {
  flex-basis: calc(25% - 10px);
  margin: 3px;
  text-decoration: none;
}

.product-container {
  width: 300px;
  height: 300px;
  display: flex;
  border: 2px solid transparent;
  flex-direction: column;
  align-items: center;
  text-align: center;
  padding: 10px;
}

@media (min-width: 768px) {
  .product {
    max-width: calc(100/3);
  }
}

.product-container:hover {
  border: 2px solid #00afea;
  background: rgba(0, 0, 0, 0.1);
}

.item {
  width: 200px;
  height: 200px;
  object-fit: cover;
  margin-bottom: 10px;
}

.product__info {
  display: flex;
  flex-direction: column; /* Mostrar los elementos h1 y h2 uno debajo del otro */
  align-items: center;
  font-family: 'Lato', sans-serif;
  text-transform: uppercase;
}

.product__info h1 {
  font-size: 24px;
}
.product__info h2 {
  color: coral;
}

.more-questions {
  width: 70%;
  height: 50px;
  border-radius: 20px;
  text-transform: uppercase;
  font-size: 16px;
  background: transparent;

  .plus {
    width: 20px;
    height: 20px;
    left: 0;
    right: 2rem;
  }
}

.hide-slidebar {
  width: 20%;
  height: 50px;
  border-radius: 40%;
  background: transparent;
}

button {
  cursor: pointer;
}
button:hover {
  background: rgba(0, 0, 0, 0.1);
}

</style>