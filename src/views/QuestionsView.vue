<template>
  <Carousel v-slot="{ currentSlide, nextSlide, showProducts, finished, changeShowProducts, setCurrentSlides}" v-show="!newCarousel">
    <Quiz v-show="!newCarousel" v-slot="{ num }" :hideCurrentIteration="hideCurrentIteration" :setCurrentSlides="setCurrentSlides" :addIteration="addIteration" :showCarouselAgain="showCarouselAgain" :changeShowProducts="changeShowProducts" :finished="finished" :showProducts="showProducts" :nextSlide="nextSlide" :currentSlide="currentSlide" :valorProp="1" :QuestionId="0">
    </Quiz>
  </Carousel>

  <div v-for="it in iterations" :key="it">
    <Carousel v-slot="{ currentSlide, nextSlide, showProducts, finished, changeShowProducts, setCurrentSlides }" v-show="newCarousel && it === currentIteration">
      <Quiz v-show="newCarousel" :hideCurrentIteration="hideCurrentIteration" :setCurrentSlides="setCurrentSlides" :addIteration="addIteration" :showCarouselAgain="showCarouselAgain" :changeShowProducts="changeShowProducts" :finished="finished" :showProducts="showProducts" :nextSlide="nextSlide" :currentSlide="currentSlide" :valorProp="it+1" :QuestionId="it * 5">

      </Quiz>
    </Carousel>
  </div>
</template>

<script>
import Carousel from '../components/Carousel.vue'
import Quiz from '../components/Quiz.vue'
import axios from 'axios';
axios.defaults.withCredentials = true;

export default {
  components: {Carousel, Quiz},
  data() {
    return {
      iterations: 0,
      newCarousel: false,
      currentIteration: 0
    }
  },
  methods: {
    async addIteration() {
      console.log("Incrementado....");
      this.iterations++;
      await new Promise(resolve => setTimeout(resolve, 2000));
    },
    async showCarouselAgain() {
      this.newCarousel = true;
      await new Promise(resolve => setTimeout(resolve, 2000));
    },
    hideCurrentIteration() {
      this.currentIteration++;
    }
  }
};
</script>

<style lang="scss" scoped>
</style>