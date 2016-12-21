


<template>
    <div>
        <el-menu theme="dark" router default-active="/"  mode="horizontal">
        <el-menu-item index="/">每日一图</el-menu-item>
        <el-menu-item index="/chat">聊天室</el-menu-item>
        <el-menu-item index="3">关于我们</el-menu-item>
        </el-menu>

        <div class='content'>
            <router-view class="view" keep-alive transition transition-mode="out-in"></router-view>
        </div>
    </div>
</template>



<script>

export default {
    data () {
        return {
            msg: 'Hello from vue-loader'
        }
    },
    methods: {
    }
}
</script>


<style>
    .el-menu {
        border-radius:0px;
    }

    .content {
        padding-top: 10px;
        max-width: 1000px;
        margin-right: auto;
        margin-left: auto
    }
</style>