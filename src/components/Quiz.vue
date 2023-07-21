<template>
  <div class="Quiz">

    <v-slot></v-slot>

    <div v-show="currentSlide  === i + 1 && !showProducts" class="container" v-for="(item, i) in list" :key="i" v-bind:style="{'background-image': 'url(' + getImage() + ')'}">
      <h1>{{ i+QuestionId+1 }}. {{ item.text }}</h1>

      <div class="q-answer">
        <div v-for="(answer, j) in item.answers" :key="j">
          <label :for="'question_' + i + valorProp + '_answer_' + j" @mouseover="changeImage(answer.text)">
            <input type="radio" @click="nextSlide" :id="'question_' + i + valorProp + '_answer_' + j" :value="answer.id"  v-model="checked[i]">
              <span>{{ answer.text }}</span>
          </label>
        </div>
      </div>


      <div class="send"  v-show="finished && currentSlide === 5">
        <button @click="sendAnswer" class="btn btn__link" >Terminar</button>
      </div>
    </div>

    <Vehicule :showProducts="showProducts" :vehicules="vehicules" :showCarouselAgain="showCarouselAgain"></Vehicule>
  </div>
</template>



<script>
import axios from 'axios'
import Vehicule from '../components/Vehicule.vue'

import clio from "../assets/clio.png"
import expensive from "../assets/expensive.png"
import jeep4x4 from "../assets/jeep4x4.png"
import kilometres from "../assets/kilometres.png"
import monovolumen from "../assets/monovolumen.png"
import priceCar from "../assets/priceCar.png"
import security from "../assets/security.png"
import sport from "../assets/sportCar.png"

export default {
  components: {Vehicule},
  props:['valorProp', 'QuestionId', 'currentSlide', 'nextSlide', 'showProducts', 'finished', 'changeShowProducts', 'showCarouselAgain'],
  data() {
    return{
      showQuiz: false,
      list: [],
      getSlideCount: null,
      checked: [],
      image: clio,
      images: [
        {link: clio, palabras:['funcional', 'ahorro', 'urbano', 'diarios', 'ciudad', 'sociales', 'funcional', 'prioridad', 'preocupación', 'calle', 'preferencia', 'novato']},
        {link: expensive, palabras:['llamativo', 'avances', 'amplio', 'lujo']},
        {link: jeep4x4, palabras:['aventurero', 'libertad', 'irregulares', 'mercancia', 'aire', 'energética', 'importancia']},
        {link: kilometres, palabras:['usado']},
        {link: monovolumen, palabras:['espacio', 'largos', 'familia', 'relajada', 'road', 'avanzados', 'confort']},
        {link: priceCar, palabras:['sofisticado', 'convencionales', 'elegante', 'media', 'cómoda', 'no tenga uso']},
        {link: security, palabras:['seguridad']},
        {link: sport, palabras:['dinámico', 'potencia', 'deportiva', 'equilibrio', 'rendimiento', 'experimentado']},
      ],
      vehicules: []
    }
  },
  methods: {
    async sendAnswer() {
      await axios.post("http://localhost:8080/quiz/answer/bulk",this.checked);
      await axios.get("http://localhost:8080/quiz/result", {withCredentials: true})
      .then(response => this.vehicules = response.data);
      this.changeShowProducts();
    },
    changeImage(answerText){
      for(const item of this.images)
      {
        for(const word of item.palabras)
        {
          if(answerText.includes(word))
          {
            this.image = item.link;
          }
        }
      }
    },
    getImage() {
      return this.image;
    }
  },
  async created(){
    this.getSlideCount = document.querySelectorAll(".container").length;
    this.vehicules = [];
    let result = await axios.get("http://localhost:8080/quiz/round");
    this.list = result.data;
    console.log(result.data);
  }
}

</script>



<style lang="scss" scoped>


.container {
  position: absolute;
  background-size: cover;
  background-position: center;
  top: 6.7rem;
  left: 0;
  width: 100%;
  height: 100vh;
  transition: background-image 0.8s ease;

  h1 {
    font-size: 32px;
    text-transform: uppercase;
    text-align: center;
    color: #fff;
  }

  .q-answer {
    position: relative;
    z-index: 1;
    background: rgba(0, 0, 0, 0.7);
    border-radius: 31px;
    justify-content: center;
    margin: 10px 30vh;
    margin-top: 25rem;
    padding: 8px;
    display: flex;
    gap: 10px;
  }

  @media (max-width: 980px) {
    .q-answer {
      top: 0;
    }
  }

  input[type="radio"] {
    display: none;
  }

  label {
    display: block;
    cursor: pointer;
    font-weight: 500;
    margin-bottom: 10px;
  }

  label span{
    text-transform: uppercase;
    display: inline-flex;
    align-items: center;
    padding: 10px 20px 10px 10px;
    border-radius: 31px;
    color: #fff;
    transition: 0.25s;
  }


  label span:hover,
  input[type="radio"]:checked + span{
    background: rgba(0, 0, 0, 0.8);
    color: #fff;
  }

  label span:before {
    visibility: hidden;
  }

  input[type="radio"]:checked + span:before {
    box-shadow: inset 0 0 0 10px #00005c;
  }

  .send {
    .btn{
        background: rgba(0, 0, 0, 0.8);
        padding: 10px 20px;
        top: 1rem;
        left: 50%;
        font-size: 20px;
        font-family: 'Montserrat';
        text-decoration: none;
        cursor: pointer;
        border-radius: 10%;
        transition: 0.8s;
        position: relative;
        z-index: 1;
        overflow: hidden;
        color: #fff;
      }
      .btn__link:hover{
        background: #00afea;
        color: rgba(0, 0, 0, 0.8);
      }
  }
}

@media (max-width: 980px) {
  .container {
    margin-top: 5rem;
    margin-left: 1rem;
  }
  

  .send {
    .btn {
      .btn__link{
        font-size: 10px;
      }
    }
  }

  label span{
    font-size: 10px;
  }
}


</style>