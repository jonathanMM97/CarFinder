<template>
  <div class="home">
    <h1>Bienvenido a CarFinder, tu guía para encontrar el coche ideal</h1>
    <span></span>
    <div class="container">
      <router-link class="btn btn-primary-1 custom-button" to="/questions">
        <span>Buscar coches</span>
        <i></i>
      </router-link>
    </div>
  </div>

  <div class="home-info">
    <h2>Plataformas en CarFinder</h2>
    <a href="#features">
      <img v-for="images in logos" :src="images">
    </a>

    <div id="features" class="features">
    
      <div class="ftr feature-1">
        <img class="image-ftr image-ftr-1" src="../assets/logo.png">
        <h3>TODO EN UN MISMO LUGAR</h3>
        <span>El mejor analizador de requisitos para coches</span>
        <p>Responde el simple cuestionario para obtener los resultados que necestias. Te mostraremos los coches que realmente estas buscando de acorde a tus gustos y te ofreceremos los diferentes enlaces.</p>
      </div>

      <div class="ftr feature-2">
        <img class="image-ftr image-ftr-2" src="../assets/icekar-logo.png">
        <h3>UNA SOLA BÚSQUEDA</h3>
        <span>Todas las plataformas en una sola búsqueda</span>
        <p>Se acabó visitar página por página y volver a introducir los modelos a los que estas interesados junto con todos los filtros que necesitas. Con CarFinder tendrás que introducir tus filtros una única vez.</p>
      </div>

      <div class="ftr feature-3">
        <img class="image-ftr" src="../assets/filters.png">
        <h3>UNA CUESTIONARIO ANALIZADOR</h3>
        <span>Un cuestionario que analiza tus gustos y preferencias</span>
        <p>CarFinder te ofrece un cuestionario sencillo de preguntas muy rápidas de contestar, con esas respuestas encontrarás tu coche que necesitas y que siempre has querido encontrar pero que hasta ahora no habías encontrado debido a los filtros anticuados.</p>
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
  height: 100vh;
  top: 0;
  left: 0;
  font-family: 'Lato', sans-serif;
  background-image: url("../assets/mainBanner.png");
  background-repeat: no-repeat;
  background-position: center center;
  background-size: contain;
  justify-items: center;
  flex-direction: column;

  h1 {
    width: 35%;
    font-size: 32px;
    text-align: center;
    color: #afaeb3;
    margin-right: auto;
    margin-top: auto;
    margin-left: 1rem;
    text-shadow: 4px 4px 8px rgba(0, 0, 0, 0.5), 8px 8px 10px rgba(0, 0, 0, 0.4);
  }
  
  span {
    font-size: 16px;
    text-align: center;
    color: silver;
    border-radius: 20%;
    margin-right: auto;
    margin-bottom: auto;
  }
  .custom-button {
  position: relative;
  background: #444;
  color: #fff;
  text-decoration: none;
  text-transform: uppercase;
  border: none;
  letter-spacing: 0.1rem;
  font-size: 1rem;
  padding: 1rem 3rem;
  transition: 0.2s;
  margin-top: auto;
  margin-bottom: 18rem;
}

.custom-button:hover {
  letter-spacing: 0.2rem;
  padding: 1.1rem 3.1rem;
  background: #FF0000;
  color: #FF0000;
  animation: box 3s infinite;
}

.custom-button::before {
  content: "";
  position: absolute;
  inset: 2px;
  background: #272822;
}

.custom-button span {
  position: relative;
  z-index: 1;
}
.custom-button i {
  position: absolute;
  inset: 0;
  display: block;
}

.custom-button i::before {
  content: "";
  position: absolute;
  width: 10px;
  height: 2px;
  left: 80%;
  top: -2px;
  border: 2px solid #FF0000;
  background: #272822;
  transition: 0.2s;
}

.custom-button:hover i::before {
  width: 15px;
  left: 20%;
  animation: move 3s infinite;
}

.custom-button i::after {
  content: "";
  position: absolute;
  width: 10px;
  height: 2px;
  left: 20%;
  bottom: -2px;
  border: 2px solid #FF0000;
  background: #272822;
  transition: 0.2s;
}

.custom-button:hover i::after {
  width: 15px;
  left: 80%;
  animation: move 3s infinite;
}

@keyframes move {
  0% {
    transform: translateX(0);
  }
  50% {
    transform: translateX(5px);
  }
  100% {
    transform: translateX(0);
  }
}

@keyframes box {
  0% {
    box-shadow: #27272c;
  }
  50% {
    box-shadow: 0 0 25px #FF0000;
  }
  100% {
    box-shadow: #27272c;
  }
}
  .container{
    position: absolute;
    height: 100%;
    display: flex;
    align-items: center;
    margin-left: 9.3rem;
  }
}

.home-info {
  position: absolute;
  width: 100%;
  height: 100%;
  top: 44.4rem;
  left: 0;
  background-color: #201f1d;
  background-size: cover;
  text-align: center;
  overflow: hidden;
  padding-bottom: 2rem;
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
    background: #161719;
    box-shadow: 0px 10px 20px rgba(0, 0, 0, 0.5);
    border-radius: 20px;
    color: #afaeb3;
    transition: transform 0.3s ease;

    .image-ftr {
      width: auto;
      height: 30%;
      margin: 1rem auto 0;
      object-fit: cover;
    }

    .image-ftr-1{
      border-radius: 20px;
    }

    .image-ftr-2{
      border-radius: 20px;
      background-color: #afaeb3;
      padding: 1rem;
    }

    p {
      margin: 2rem 1rem 1rem 1rem;
    }

    h3 {
      font-size: 16px;
      font-family: 'Lato', sans-serif;
      color: #9d3426;
    }

    span {
      font-size: 32px;
      font-family: 'Lato', sans-serif;
      color: #afaeb3;
    }

    &:hover {
      transform: scale(1.05);
    }
  }
}
</style>