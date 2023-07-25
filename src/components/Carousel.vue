<template>
  <div class="carousel">
    <slot :setCurrentSlides="setCurrentSlides" :currentSlide="currentSlide" :nextSlide="nextSlide" :showProducts="showProducts" :finished="finished" :changeShowProducts="changeShowProducts"></slot>

    <!-- Navigation -->
    <div class="navigate" v-show="!showProducts">
      <div v-show="currentSlide != 1 && currentSlide != (currentSlides+1)" class="toggle-page left" @click="prevSlide">
        <i class="fas fa-chevron-left"></i>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data() {
    return {
      currentSlide: 1,
      finished: false,
      showProducts: false,
      currentSlides: null,
    };
  },
  methods: {
    async setCurrentSlides(slides) {
      this.currentSlides = slides;
      console.log(this.currentSlides);
    },
    prevSlide() {
      if (this.currentSlide === 1) {
        this.currentSlide = 1;
        return;
      }
      this.currentSlide -= 1;
    },
    nextSlide() {
      if (this.currentSlide === this.currentSlides) {
        this.finished = true;
        return;
      }
      this.currentSlide += 1;
    },
    changeShowProducts() {
      this.showProducts = !this.showProducts;
    }
  }
};
</script>

<style lang="scss" scoped>

.navigate {
  padding: 0 16px;
  height: auto;
  width: 100vh;
  margin-left: 3rem;
  position: absolute;
  display: flex;
  justify-content: center;
  align-items: center;
  background-position: center;

  .toggle-page {
    cursor: pointer;
    display: flex;
    flex: 1;

    &.left {
      height: 100%;
      width: 10%;
      background-color: rgba(0, 0, 0, 0.24);
      position: fixed;
      left: 0;
      top: 0;
      display: flex;
      align-items: center;
      justify-content: center;
      transition: background-color 0.3s ease, transform 0.3s ease;
      transform-origin: center;
    }

    &.left:hover {
      background-color: rgba(0, 0, 0, 0.7);
      transform: scale(1.15);
    }

    i {
      background-color: transparent;
      transition: background-color 0.3s ease;
    }
  }

  i {
    cursor: pointer;
    display: flex;
    align-items: center;
    justify-content: center;
    border-radius: 50%;
    width: 40px;
    height: 40px;
    background-color: rgba(0, 0, 0, 0.8);
    color: #fff;
    transition: 0.8s ease all;
  }
}
</style>
