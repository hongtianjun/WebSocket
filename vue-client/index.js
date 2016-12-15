
import Vue from 'vue'
import VueSocketIO from 'vue-socket.io'
import ElementUI from 'element-ui'
import 'element-ui/lib/theme-default/index.css'

import App from './App.vue'

Vue.use(ElementUI)
Vue.use(VueSocketIO,'http://127.0.0.1:3301')

new Vue ({
    el: "#chat-dialog",
    render: function(createElement) {
      return createElement(App)
    }
});