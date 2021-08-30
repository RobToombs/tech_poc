import { createRouter, createWebHistory } from "vue-router";
import Information from "../views/Information.vue";

const routes = [
  {
    path: "/patient/info",
    name: "Info",
    component: Information,
    meta: {
      title: "Patient Information",
    },
  },
  {
    path: "/patient/cards",
    name: "Cards",
    meta: {
      title: "Patient Cards",
    },
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () =>
      import(/* webpackChunkName: "about" */ "../views/Cards.vue"),
  },
];

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes: routes,
});

router.beforeEach((to, from, next) => {
  document.title = to.meta.title
  next()
})

export default router;
