<template>
  <Carousel v-slot="{ currentSlide, nextSlide, showProducts, finished, changeShowProducts }" v-show="!newCarousel">
    <Quiz v-show="!newCarousel" :showCarouselAgain="showCarouselAgain" :changeShowProducts="changeShowProducts" :finished="finished" :showProducts="showProducts" :nextSlide="nextSlide" :currentSlide="currentSlide" :valorProp="1" :QuestionId="0" @hideCarousel="isVisible = false">
      
    </Quiz>
  </Carousel>

</template>

<script>
import Carousel from '../components/Carousel.vue'
import Quiz from '../components/Quiz.vue'



export default {
  components: {Carousel, Quiz},
  data() {
    return {
      newCarousel: false,
    }
  },
  methods: {
    async showCarouselAgain() {
      this.newCarousel = true;
      await new Promise(resolve => setTimeout(resolve, 2000));
    }
  }
};
</script>

<style lang="scss" scoped>

</style>