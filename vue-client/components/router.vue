
<template>
        <router-view></router-view>
</template>



<script>

import Vue from 'vue'
import APod from './apod.vue'
import VueRouter from 'vue-router'

module.exports = new VueRouter({
    routes: [
        { path: '/user/:id', component: APod }
    ]
});

Vue.component("Router",Router);

</script>