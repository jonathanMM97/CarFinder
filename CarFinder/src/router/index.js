import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../views/HomeView.vue'
import LoginView from '../views/LoginView.vue'
import SingupView from '../views/SingupView.vue'
import QuestionsView from '../views/QuestionsView.vue'
import ManageView from '../views/ManageView.vue'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'home',
      component: HomeView
    },
    {
      path: '/login',
      name: 'log-in',
      component: LoginView
    },
    {
      path: '/signup',
      name: 'sign-up',
      component: SingupView
    },
    {
      path: '/questions',
      name: 'questions',
      component: QuestionsView
    },
    {
      path: '/manage',
      name: 'manage',
      component: ManageView
    }
  ]
})

export default router
