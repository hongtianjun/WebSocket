


<template>
    <div class='xx'>
    <el-card class="box-card" v-if='!join'>
        <div slot="header" class="clearfix">
            <span style="line-height: 36px;">输入你的名字</span>
            <el-button style="float: right;" type="primary" v-on:click="greet">开始聊天</el-button>
        </div>
        <el-input placeholder="请输入你的名字" v-model="name"></el-input>
    </el-card>

    <el-card class="box-card" v-if='join'>
        <div class="messages">
        <ul class="list-unstyled">
            <li v-for="m in messages" :class="{me: (m.name === name), clearfix: true}">
                <div class="name">{{m.name}}</div>
                <span>{{m.message}}</span>
            </li>
        </ul>
        </div>

        <el-input placeholder="请输入内容" v-model="message"></el-input>
        <span><el-button  type="primary" v-on:click="send">发送</el-button></span>
    </el-card>
    </div>
</template>


import VueSocketIO from 'vue-socket.io'
Vue.use(VueSocketIO,'http://127.0.0.1:3301')

<script>

    export default {
        data () {
            return {
                msg: 'Hello from vue-loader',
                join: false,
                name: null,
                users: {},
                message: null,
                messages: {}
            }
        },
        sockets: {
            connect: function(){
                console.log('socket connected');
            },
            joined:function(msg) {
                this.join = msg['result'];
            },
            adduser:function(msg) {
                //this.users.push(msg['name'])
            },
            messages:function(results) {
                this.messages = results['messages']
            },
            onmessage: function(msg) {
                this.messages.push(msg);
            }
        },
        methods: {
            greet: function (event) {
                if (this.name == null || this.name == '' || this.name.length == 0) {
                    alert('需要输入您的名字!!');
                    return;
                }
                this.$socket.emit('join', {'text':this.name});
            },
            send: function (event) {
                if (this.message == null || this.message == '' || this.message.length == 0) {
                    alert('输入你要发送的内容!');
                    return;
                }
                this.$socket.emit('hi', {'message':this.message});
                this.message = null;
            }
        }
    }
</script>


<style>
    .message{
        color: red;
        font-size: 36px;
        font-weight: blod;
    }
    .container {
        max-width: 700px;
        margin-right: auto;
        margin-left: auto
    }
    .messages {
        height: 278px;
        overflow:scroll;
    }

    .messages ul li .name {
        font-size: 12px;
        font-weight: bold;
        margin-bottom: 5px;
    }

    .messages ul li {
        margin-bottom: 10px;
    }

    .messages ul li span {
        border-radius: 5px !important;
        background: #E0EDFF;
        padding: 5px 12px;
        font-size: 15px;
    }


</style>