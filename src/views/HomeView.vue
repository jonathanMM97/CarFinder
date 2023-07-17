

<template>
  <div class="home">
    <h1>Bienvenido a CarFinder tu guía de coches para cualquiera que sea tu estilo al bolante</h1>
    <span>Descubre tus gustos, aquellos que no sabías que tenias con CarFinder</span>
    <div class="container">
      <router-link class="btn btn-primary-1" to="/questions">Buscar coches</router-link>
    </div>
  </div>

  <div class="home-info">
    <h2>Plataformas en CarFinder</h2>
    <a href="#features">
      <img v-for="images in logos" :src="images">
    </a>

    <div id="features" class="features">
    
      <div class="ftr feature-1">
        <img class="image-ftr" src="../assets/carFinder.png">
        <p>TODO EN UN MISMO LUGAR</p>
        <span>El mejor analizador de requisitos para coches</span>
        Responde el simple cuestionario para obtener los resultados que necestias. Te mostraremos los coches que realmente estas buscando de acorde a tus gustos y te ofreceremos los diferentes enlaces
      </div>

      <div class="ftr feature-2">
        <img class="image-ftr" src="../assets/carFinder.png">
        <p>UNA SOLA BÚSQUEDA</p>
        <span>Todas las plataformas en una sola búsqueda</span>
        Se acabó visitar página por página y volver a introducir los modelos a los que estas interesados junto con todos los filtros que necesitas. Con CarFinder tendrás que introducir tus filtros una única vez.
      </div>

      <div class="ftr feature-3">
        <img class="image-ftr-1" src="../assets/filters.png">
        <p>UNA CUESTIONARIO ANALIZADOR</p>
        <span>Un cuestionario que analiza tus gustos y preferencias</span>
        CarFinder te ofrece un cuestionario sencillo de preguntas muy rápidas de contestar, con esas respuestas encontrarás tu coche que necesitas y que siempre has querido encontrar pero que hasta ahora no habías encontrado debido a los filtros anticuados.
      </div>
    </div>
  </div>
</template>

<script>
import autoscout from "../assets/autoscout.png"
import coches77 from "../assets/coches77.png"
import cochesnet from "../assets/cochesnet.png"
import keycar from "../assets/keycar.png"
import motores from "../assets/motores.png"
import motorgiga from "../assets/motorgiga.png"
import wallapop from "../assets/wallapop.png"
export default {
  data(){
    return {
      logos: [autoscout, coches77, cochesnet, keycar, motores, motorgiga, wallapop]
    }
  }
}
</script>

<style lang="scss" scoped>
.home{
  position: absolute;
  display: flex;
  width: 100%;
  height: 100%;
  top: 0;
  left: 0;
  font-family: 'Lato', sans-serif;
  background-image: url("../assets/logo.png");
  background-size: cover;
  background-repeat: no-repeat;
  background-position: center;
  justify-items: center;
  flex-direction: column;

  h1 {
    width: 50%;
    font-size: 32px;
    text-align: center;
    text-shadow: 2px 2px 4px #00b0ea56, 0px 0px 8px #00b0ea86;
    color: rgba(0, 0, 0, 0.8) ;
    margin-left: auto;
    margin-right: auto;
    margin-top: auto;
  }
  
  span {
    font-size: 16px;
    text-align: center;
    color: silver;
    background-color: rgba(0, 0, 0, 0.8);
    border-radius: 20%;
    margin-left: auto;
    margin-right: auto;
    margin-bottom: auto;
  }
  .container{
    position: absolute;
    width: 100%;
    height: 100%;
    display: flex;
    align-items: center;
    justify-content: center;
    .btn{
      background: #00afea;
      padding: 10px 20px;
      top: 17rem;
      font-size: 20px;
      font-family: 'Montserrat';
      text-decoration: none;
      cursor: pointer;
      margin: 190px;
      border-radius: 20px;
      transition: 0.8s;
      position: relative;
      overflow: hidden;
      color: rgba(0, 0, 0, 0.8);
    }

    .btn-primary-1:hover,
    .btn-primary-2:hover{
      color: #fff;
      text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.8);
    }
  }
}

.home-info {
  position: absolute;
  width: 100%;
  height: 100%;
  top: 50rem;
  left: 0;
  background-color: #201f1d;
  background-size: cover;
  text-align: center;
  overflow: hidden;
  
}

.home-info h2 {
  font-size: 24px;
  color: silver;
  margin-bottom: 10px;
  padding: 20px;
}

.home-info img {
  width: 164px;
  height: 46px;
  justify-content: space-between;
  margin-left: 20px;
}

.features {
  margin-top: 6rem;
  display: flex;
  width: 100%;
  height: 66%;
  align-items: center;
  margin-bottom: 2rem;
  border-radius: 20%;

  .ftr{
    display: flex;
    flex-direction: column;
    margin-left: 4rem;
    overflow: hidden;
    width: 400px;
    height: 500px;
    background: linear-gradient(to bottom, #fff, #201f1d);
    box-shadow: 0px 10px 10px #00afea;
    border-radius: 20%;
    color: #fff;

    .image-ftr {
      width: 100%;
      height: 30%;
      justify-content: center;
      scale: 2;
    }

    .image-ftr-1 {
      width: 100%;
      height: 30%;
      justify-content: center;
      scale: 1.1;
    }

    p{
      font-size: 16px;
      font-family: 'Lato', sans-serif;
      color: #00afea;
    }

    span {
      font-size: 32px;
      font-family: 'Lato', sans-serif;
      color: rgba(0, 0, 0, 0.8);
      margin-bottom: 4rem;
    }
  }
}
</style>