<template>
  <Carousel v-show="!showProducts" v-slot="{ currentSlide, nextSlide, finished }">
    <div v-show="currentSlide  === i + 1" class="container" v-for="(item, i) in list" :key="i" v-bind:style="{'background-image': 'url(' + getRandomImage() + ')'}">
      <h1>{{ i+1 }}. {{ item.text }}</h1>

      <div class="q-answer">
        <div v-for="(answer, j) in item.answers" :key="j">
          <label :for="'question_' + i + '_answer_' + j">
            <input type="radio" @click="nextSlide" :id="'question_' + i + '_answer_' + j" :value="answer.id" :name="'question_' + i" v-model="checked[i]">
              <span>{{ answer.text }}</span>
          </label>
        </div>
      </div>


      <div class="send"  v-show="finished && currentSlide === 5">
        <button @click="sendAnswer" class="btn btn__link" >Terminar</button>
      </div>
    </div>
  </Carousel>




  <div class="product" v-show="showProducts" v-for="vehicules in vehicules">
    <img class="item" :src="vehicules.images[0]">
    <div class="product__info">
      <h1>{{ vehicules.title }}</h1>
      <h2>{{ vehicules.price }} €</h2>
      <a class="item-link" :href="vehicules.links[0].link">{{ vehicules.links[0].origin }}</a>
    </div>
  </div>
</template>

<script>
import axios from 'axios'
import Carousel from '../components/Carousel.vue'

import clio from "../assets/clio.png"
import diesel from "../assets/diesel.png"
import expensive from "../assets/expensive.png"
import jeep4x4 from "../assets/jeep4x4.png"
import kilometres from "../assets/kilometres.png"
import manual from "../assets/manual.png"
import monovolumen from "../assets/monovolumen.png"
import priceCar from "../assets/priceCar.png"
import security from "../assets/security.png"
import sport from "../assets/sportCar.png"


export default {
  data() {
    return {
      index: 9,
      showProducts: false,
      currentSlides: null,
      image: [clio, diesel, expensive, jeep4x4, kilometres, manual, monovolumen, priceCar, security, sport],
      logos: ["../assets/autoscout.png", "../assets/coches77.png", "../assets/cochesnet.png", "../assets/keycar.png", "../assets/motores.png", "../assets/motorgiga.png", "../assets/wallapop.png"],
      checked: [],
      list:[],
      vehicules: []
    }
  },
  methods:{
    async sendAnswer() {
        await axios.post("http://localhost:8080/quiz/answer/bulk",this.checked)
        .then(response => this.vehicules = response.data);
        console.log(this.vehicules.images);
        this.showProducts = true;
    },
    getRandomImage() {
        const randomIndex = Math.floor(Math.random() * this.image.length);
        return this.image[randomIndex];
    },
  }
  ,
  async mounted(){
    let result = await axios.get("http://localhost:8080/quiz/round");
    this.list = result.data;
  },
  components: {Carousel},
};
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

.product {
  display: flex;
  width: 500px;
  height: 250px;
  align-items: center;
  margin-bottom: 2rem;
  background: #fff;
  border-radius: 20%;
  .item{
    width: 250px;
    height: 250px;
    border-top-left-radius: 30px;
    border-bottom-left-radius: 30px;
  }

  &__info{
    text-decoration: none;
    margin-left: 0.5rem;
    width: 250px;
    height: 250px;
    color: red;
    h1{
      width: 100%;
      height: 20%;
      font-size: 16px;
      color: rgba(0, 0, 0, 0.8);
    }
    h2 {
      width: 100%;
      height: 25%;
      text-align: center;
    }
    .item-link {
      text-decoration: none;
      color: #00afea;
    }
  }
}

/* Responsive Styles */

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