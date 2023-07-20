<template>
  <Carousel v-slot="{ currentSlide, nextSlide, showProducts, finished, changeShowProducts }" v-show="!newCarousel">
    <Quiz v-show="!newCarousel" :showCarouselAgain="showCarouselAgain" :changeShowProducts="changeShowProducts" :finished="finished" :showProducts="showProducts" :nextSlide="nextSlide" :currentSlide="currentSlide" :valorProp="1" :QuestionId="0" @hideCarousel="isVisible = false">
      
    </Quiz>
  </Carousel>

  <Carousel v-slot="{ currentSlide, nextSlide, showProducts, finished, changeShowProducts }" v-show="newCarousel">
    <Quiz v-show="newCarousel" :showCarouselAgain="showCarouselAgain" :changeShowProducts="changeShowProducts" :finished="finished" :showProducts="showProducts" :nextSlide="nextSlide" :currentSlide="currentSlide" :valorProp="2" :QuestionId="5" @hideCarousel="isVisible = false">
        
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
      console.log("Realiza el metodo");
      this.newCarousel = true;
      await new Promise(resolve => setTimeout(resolve, 2000));
    }
  }
};
</script>

<style lang="scss" scoped>

.quiz-advance {
    position: absolute;
    top: 0;
    left: 0;
    width: 80%; /* Ajusta el ancho de la ventana según tus necesidades */
    height: 80%; /* Ajusta la altura de la ventana según tus necesidades */
    z-index: 9999; /* Asegura que el contenedor esté por encima de todo */
    background-color: white; /* Puedes cambiar el color de fondo según tus preferencias */
    border: 1px solid #ccc; /* Agrega un borde si lo deseas */
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* Agrega sombra si lo deseas */
    margin: auto; /* Centra el contenedor en la pantalla horizontalmente */
    top: 0; bottom: 0; left: 0; right: 0; /* Centra el contenedor en la pantalla verticalmente */
  }
</style>