<template>
    <div>
        <v-app id="inspire" dark>
            <h1>{{message}}</h1>
            <layout-main/>
        </v-app>
    </div>
</template>

<script>

    import LayoutMain from './components/layouts/LayoutMain'
    export default {
        data(){
            return{
                message: 'hello'
            }
        },
        components:{
            LayoutMain
        }
    }
</script>