<template>
  <header :class="{ 'scrolled-nav': scrolledNav }">
    <nav>
      <div class="logo">
        <router-link to="/">
          <img src="../assets/logo.png">
        </router-link>
      </div>
      <ul v-show="!mobile" class="navigation">
        <li><router-link class="nav-link" to="/">Home</router-link></li>
        <li><router-link class="nav-link" to="/questions">Products</router-link></li>
        <li><router-link class="nav-link" to="/manage">Gestionar</router-link></li>
        <div v-if="user" class="dropdown" @click="toggleSubMenu">
            <img @click="showinfoNav" :src="user.pictureUrl" class="user-avatar">
            <transition name="user-info">
              <ul v-show="infoNav" class="info-nav">
                <span class="user-name">{{ user.name }}</span>
                <div class="dropdown-menu" v-show="showSubMenu">
                    <a class="nav-link" href="http://localhost:8080/logout">Logout</a>
                </div>
              </ul>
            </transition>
        </div>
        <div v-else class="login">
            <router-link class="login__link" to="/login">Iniciar Sesión</router-link>
        </div>
      </ul>
      <div class="icon">
        <i @click="toggleMobileNav" v-show="mobile" class="far fa-bars" :class="{ 'icon-active': mobileNav }"></i>
      </div>
      <transition name="mobile-nav">
        <ul v-show="mobileNav" class="dropdown-nav">
          <li><router-link class="nav-link" to="/">Home</router-link></li>
          <li><router-link class="nav-link" to="/questions">Products</router-link></li>
          <li><router-link class="nav-link" to="http://localhost:8080/quiz/answer/bulk">Gestionar</router-link></li>
        </ul>
      </transition>
    </nav>
  </header>
</template>

<script>
import axios from 'axios'
export default{
  name: "navigation",
  data() {
    return {
      user: null,
      scrolledNav: null,
      mobile: null,
      mobileNav: null,
      windowWidth: null,
      showSubMenu: false,
      infoNav: false,
    };
  },
  created() {
    this.fetchUserInfo();
    window.addEventListener('resize', this.checkScreen);
    this.checkScreen();
  },
  mounted() {
    window.addEventListener("scroll", this.updateScroll);
  },
  methods: {
    toggleMobileNav() {
      this.mobileNav = !this.mobileNav;
    },

    updateScroll() {
      const scrollPosition = window.scrollY;
      if (scrollPosition > 50) {
        this.scrolledNav = true;
        return;
      }
      this.scrolledNav = false;
    },
    checkScreen() {
      this.windowWidth = window.innerWidth;
      if (this.windowWidth <= 750) {
        this.mobile = true;
        return;
      }
      this.mobile = false;
      this.mobileNav = false;
      return;
    },
    fetchUserInfo() {
        axios.get('http://localhost:8080/userInfo', { withCredentials: true })
        .then(response => {
            this.user = response.data;
        }).catch(error => {
            console.error('Error al obtener la información del usuario:', error);
        });
    },
    toggleSubMenu() {
        this.showSubMenu = !this.showSubMenu;
    },
    showinfoNav() {
      this.infoNav = !this.infoNav;
    }
  },
};
</script>


<style lang="scss" scoped>
header {
  background-color: rgba(0, 0, 0, 0.8);
  font-family: 'Montserrat', sans-serif;
  position: fixed;
  z-index: 99;
  width: 100%;
  transition: 0.5s ease all;
  color: #fff;
  left: 0;
  top: 0;

  nav{
    position: relative;
    display: flex;
    flex-direction: row;
    padding: 12px 0;
    transition: 0.5s ease all;
    width: 90%;
    margin: 0 auto;
    @media (min-width: 1140px){
      max-width: 1140px;
    }

    ul,
    .nav-link {
      font-weight: 500;
      color: #fff;
      list-style: none;
      text-decoration: none;
    }

    li{
      text-transform: uppercase;
      padding: 16px;
      margin-left: 16px;
    }
    .nav-link {
      font-size: 14px;
      transition: 0.5s ease all;
      padding-bottom: 4px;
      border-bottom: 1px solid transparent;

      &:hover{
        color: #00afea;
      }
    }

    .logo{
      display: flex;
      align-items: center;

      img {
        width: 50px;
        transition: 0.5s ease all;
      }
    }

    .navigation{
      display: flex;
      align-items: center;
      flex: 1;
      justify-content: flex-end;;
    }

    .login__link {
      text-transform: uppercase;
      border: 2px solid #fff;
      border-radius: 20px;
      padding: 0 5px;
      text-decoration: none;
      text-decoration-style: none;
      color: #fff;
      transition: 0.5s ease all;
    }

    .login__link:hover {
      border: 2px solid #00afea;
      background: #00afea;
      color: rgba(0, 0, 0, 0.8);
    }
    .icon{
      display: flex;
      align-items: center;
      position: absolute;
      top: 0;
      right: 24px;
      height: 100%;

      i {
        cursor: pointer;
        font-size: 24px;
        transition: 0.8s ease all;
      }
    }

    .icon-active {
      transform: rotate(180deg);
    }

    .info-nav {
      display: flex;
      flex-direction: column;
      position: fixed;
      border-bottom-left-radius: 30px;
      width: 100%;
      max-width: 250px;
      height: 10%;
      background-color: rgba(0, 0, 0, 0.8);
      top: 6.7rem;
      left: 80%;
    }

    .dropdown-nav {
      display: flex;
      flex-direction: column;
      position: fixed;
      width: 100%;
      max-width: 250px;
      height: 100%;
      background-color: #000;
      top: 0;
      left: 0;
      margin-top: 0;
    }

    .mobile-nav-enter-active,
    .mobile-nav-leave-active {
      transition: 1s ease all;
    }

    .mobile-nav-enter-from,
    .mobile-nav-leave-to{
      transform: translateX(-250px);
    } 

    .mobile-nav-enter-to {
      transform: translateX(0);
    }

    .user-avatar {
        width: 45px;
        height: 45px;
        border-radius: 50%;
        cursor: pointer;
        transition: box-shadow 0.3s ease;
    }

    .user-name {
      color: #fff;
      margin-bottom: 2rem;
    }

    .user-avatar:hover{
      box-shadow: 0 0 20px #00afea
    }
  }
}

.scrolled-nav{
  background-color: #000;
  box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);

  nav{
    padding: 8px 0;

    .logo {
      img{
        width: 40px;
        box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
      }
    }
  }
}
</style>