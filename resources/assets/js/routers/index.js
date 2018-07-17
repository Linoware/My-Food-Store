import Vue from 'vue'
import VueResource from "vue-resource";
import VueRouter from "vue-router";
import ItemRouter from './items'
import Home from '../Home'

Vue.use(VueResource)
Vue.use(VueRouter)


const ROUTES = [
    // Default route
    {
        path: '',
        redirect: '/items',
    }
]
    .concat(ItemRouter)


const router = new VueRouter({
    mode: 'history',
    path: '',
    routes: ROUTES,
    components: { Home },
})

router.beforeEach((to, from, next) => {
    // Add tiny timeout to finish page transition
    setTimeout(() => next(), 10)
})

export default router