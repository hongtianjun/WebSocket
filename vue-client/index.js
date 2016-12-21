
import Vue from 'vue'
import VueRouter from 'vue-router'

//使用路由插件
Vue.use(VueRouter)

import ElementUI from 'element-ui'
import 'element-ui/lib/theme-default/index.css'

import App from './App.vue'

Vue.use(ElementUI)



import APod from './components/apod.vue'
import Chat from './components/chat.vue'

const router = new VueRouter({
    routes: [
        { path: '/', component: APod },
        { path: '/chat', component: Chat }
    ]
});

new Vue ({
    router,
    el: "#chat-dialog",
    render: function(createElement) {
      return createElement(App)
    }
});