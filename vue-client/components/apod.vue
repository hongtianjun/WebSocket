


<template>
    <div class='xx'>
    <el-row align="middle" type="flex" class="row-bg" justify="space-between">
        <el-col :span="7" v-for="(o, index) in 3" >
            <el-card class="box-card">
                <div style="padding: 14px;">
                    <span>好吃的汉堡</span>
                    <div class="bottom clearfix">
                    <el-button type="text" class="button">操作按钮</el-button>
                    </div>
                </div>
            </el-card>
        </el-col>
    </el-row>
    <el-row align="bottom" type="flex" class="row-bg" justify="space-between">
        <el-col :span="7" v-for="(o, index) in 3" >
            <el-card class="box-card">
                <div style="padding: 14px;">
                    <span>好吃的汉堡</span>
                    <div class="bottom clearfix">
                    <el-button type="text" class="button">操作按钮</el-button>
                    </div>
                </div>
            </el-card>
        </el-col>
    </el-row>
    </div>
</template>


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
    .el-row {
        margin-bottom: 20px;
    }
    .row-bg {
        padding: 10px 0;
        background-color: #f9fafc;
    }
</style>