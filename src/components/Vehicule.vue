<template>
  <div v-show="showProducts" class="show">

    <v-slot :localVehicules="localVehicules"></v-slot>

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
      <button @click="reestablisQuestions" class="more-questions">
        Reestablecer Preguntas
      </button>
    </div>
    <div v-show="!showNavSearch" class="hide-navSearch">
      <button @click="changevisible" class="hide-slidebar">
        <span class="material-symbols-outlined">
          dock_to_right
        </span>
      </button>
    </div>
    <div class="products-filter">
      <!-- Filters -->
      <div class="filters">
        <span v-show="!productWrap" @click="changeAsWrap" class="material-symbols-outlined"> flex_wrap </span>
        <span v-show="!productList" @click="changeAsList" class="material-symbols-outlined"> wrap_text </span>
        <span @click="sortProduct" class="material-symbols-outlined"> sort </span>
      </div>

      <div v-show="sortFiler" class="sort-filter">
        <span @click="sorterLowHigh" >Precio: de mas barato a mas caro</span>
        <span @click="sorterHighLow" >Precio: de mas caro a mas barato</span>
        <span @click="sorterDefault" >Por defecto</span>
      </div>

      <div class="product" v-show="!newCarousel && !showLocalVehicule">
        <a v-show="productWrap" v-for="vehiculo in vehicules" :key="vehiculo.id" :href="vehiculo.link" class="product" target="_blank">
          <div class="product-container">
            <img class="item" :src="vehiculo.image">
            <div class="product__info">
              <h1>{{ vehiculo.title }}</h1>
              <h2>{{ vehiculo.price.toLocaleString('en', { useGrouping: true, minimumFractionDigits: 0, maximumFractionDigits: 0, minimumIntegerDigits: 1 }) }} €</h2>
            </div>
          </div>
        </a>
      </div>

      <div class="product-list" v-show="!newCarousel && !showLocalVehicule">
        <a v-show="productList" v-for="vehiculo in vehicules" :key="vehiculo.id" :href="vehiculo.link" class="product-list" target="_blank">
          <div class="product-container-list">
            <img class="item-list" :src="vehiculo.image">
            <div class="product__info__list">
              <h1>{{ vehiculo.title }}</h1>
              <h2>{{ vehiculo.price.toLocaleString('en', { useGrouping: true, minimumFractionDigits: 0, maximumFractionDigits: 0, minimumIntegerDigits: 1 }) }} €</h2>
            </div>
          </div>
        </a>
      </div>

      <div class="product" v-show="!newCarousel && showLocalVehicule">
        <a v-show="productWrap" v-for="vehiculo in localVehicules" :key="vehiculo.id" :href="vehiculo.link" class="product" target="_blank">
          <div class="product-container">
            <img class="item" :src="vehiculo.image">
            <div class="product__info">
              <h1>{{ vehiculo.title }}</h1>
              <h2>{{ vehiculo.price.toLocaleString('en', { useGrouping: true, minimumFractionDigits: 0, maximumFractionDigits: 0, minimumIntegerDigits: 1 }) }} €</h2>
            </div>
          </div>
        </a>
      </div>

      <div class="product-list" v-show="!newCarousel && showLocalVehicule">
        <a v-show="productList" v-for="vehiculo in localVehicules" :key="vehiculo.id" :href="vehiculo.link" class="product-list" target="_blank">
          <div class="product-container-list">
            <img class="item-list" :src="vehiculo.image">
            <div class="product__info__list">
              <h1>{{ vehiculo.title }}</h1>
              <h2>{{ vehiculo.price.toLocaleString('en', { useGrouping: true, minimumFractionDigits: 0, maximumFractionDigits: 0, minimumIntegerDigits: 1 }) }} €</h2>
            </div>
          </div>
        </a>
      </div>
    </div>

  </div>
</template>

<script>
import axios from 'axios';
axios.defaults.withCredentials = true;

export default {
  props:['vehicules', 'showCarouselAgain', 'showProducts', 'addIteration'],
  data() {
    return {
      showLocalVehicule: false,
      sortFiler: false,
      productWrap: true,
      productList:false,
      showNavSearch: true,
      isVisible: true,
      currentSlides: null,
      newCarousel: false,
      localVehicules: this.vehicules,
    }
  },
  methods: {
    sortProduct() {
      this.sortFiler = !this.sortFiler;
    },
    sorterDefault() {
      this.showLocalVehicule = false;
    },
    async sorterLowHigh() {
      this.showLocalVehicule = true;
      try {
        const response = await axios.get("http://localhost:8080/quiz/result/1", { withCredentials: true });
        this.localVehicules = response.data; // Asigna la respuesta a la variable this.vehicules
      } catch (error) {
        console.error(error); // Agrega un bloque de captura para manejar posibles errores
      }
    },
    async sorterHighLow() {
      this.showLocalVehicule = true;
      try {
        const response = await axios.get("http://localhost:8080/quiz/result/2", { withCredentials: true });
        this.localVehicules = response.data; // Asigna la respuesta a la variable this.vehicules
      } catch (error) {
        console.error(error); // Agrega un bloque de captura para manejar posibles errores
      }
    },
    changeAsList() {
      this.productWrap = false;
      this.productList = true;
    },
    changeAsWrap() {
      this.productWrap = true;
      this.productList = false;
    },
    llamada() {
      this.addIteration();
      this.showCarouselAgain();
    },
    changevisible() {
      this.showNavSearch = !this.showNavSearch;
    },
    async reestablisQuestions() {
    let confirmResult = window.confirm('¿Quiere restablecer sus respuestas y comenzar el cuestionario de nuevo?');
      if (confirmResult) {
        let response = await axios.post("http://localhost:8080/quiz/reestablish", {withCredentials: true});
        console.log(response);
        confirmResult = window.confirm('Se reestablecieron las respuestas...');
      }
    }
  },
  async mounted() {
    try {
        const response = await axios.get("http://localhost:8080/quiz/result", { withCredentials: true });
        this.localVehicules = response.data; // Asigna la respuesta a la variable this.vehicules
      } catch (error) {
        console.error(error); // Agrega un bloque de captura para manejar posibles errores
      }
  }
};
</script>

<style lang="scss" scoped>
.show {
  position: fixed;
  display: flex;
  margin-top: 6.7rem;
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
  margin-left: -10px;
  background: rgba(0, 0, 0, 0.1);


  button {
    width: 100%;
  }
}

.products-filter {
  display: flex;
  flex-direction: column;
  margin-left: 0;
}

.filters {
  position: absolute;
  display: flex;
  flex-direction: row;
  align-items: center;
  padding: 10px;
  background: rgba(0, 0, 0, 0.1);
  border-bottom: 1px solid rgba(0, 0, 0, 0.2);
  width: 100vw;
  height: 4vh;
}

.filters span {
  cursor: pointer;
  margin-left: 40px;
}

.filters span:hover {
  background: rgba(0, 0, 0, 0.2);
  border-radius: 10px;
}

.sort-filter {
  width: 300px;
  height: 120px;
  position:fixed;
  display: flex;
  cursor: pointer;
  flex-direction: column;
  justify-content: center;
  text-align: center;
  margin-top: 2.3rem;
  margin-left: 7rem;
  box-shadow: 4px 4px 8px rgba(0, 0, 0, 0.5), 8px 8px 10px rgba(0, 0, 0, 0.4);
  border-radius: 20px;
  background: #fff;

  span {
    padding: 10px;
  }
}

.sort-filter span:hover {
  border-radius: 20px;
  background: rgba(0, 0, 0, 0.2);
}

/* Contenedor de productos */
.product {
  overflow-y: auto; /* Habilita el scroll solo cuando el contenido excede el espacio disponible */
  max-height: 80vh;
  margin-top: 2.4rem;
  flex: 1; /* El contenedor de productos ocupará el espacio restante */
  display: flex;
  flex-wrap: wrap;
  justify-content: flex-start; /* Alinea los productos al inicio */
  color: black
}

.product {
  flex-basis: calc(25% - 10px);
  text-decoration: none;
}

.product-list {
  flex: 1; /* El contenedor de productos ocupará el espacio restante */
  display: flex;
  flex-direction: column;
}

.product-list {
  overflow-y: auto; /* Habilita el scroll solo cuando el contenido excede el espacio disponible */
  max-height: 81vh;
  text-decoration: none;
  color: black;
}

.product-container-list {
  width: 77vw;
  display: flex;
  margin-bottom: 10px;
  border: 2px solid transparent;
  flex-direction: row;
  align-items: center;
}

.product-container {
  width: 300px;
  height: 400px;
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

  .product-list {
    max-width: 100%;
  }
}

.product-container:hover {
  border: 2px solid #00afea;
  background: rgba(0, 0, 0, 0.1);
}

.product-container-list:hover {
  border: 2px solid #00afea;
  background: rgba(0, 0, 0, 0.1);
}

.item {
  width: 200px;
  height: 200px;
  object-fit: cover;
  margin-bottom: 10px;
}

.item-list {
  width: 300px;
  height: 300px;
  flex: 0 0 auto;
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

.product__info__list {
  width: 100%;
  display: flex;
  text-align: center;
  flex-direction: column; /* Mostrar los elementos h1 y h2 uno debajo del otro */
  font-family: 'Lato', sans-serif;
  text-transform: uppercase;
}

.product__info__list h1 {
  font-size: 24px;
}
.product__info__list h2 {
  color: coral;
}

.more-questions {
  width: 70%;
  height: 50px;
  margin-top: 2rem;
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
  margin-top: 2rem;
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