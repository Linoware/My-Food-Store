<template>
    <v-app id="inspire">

        <v-container grid-list-xl>
            <v-card>

                <v-form ref="form" v-model="valid" lazy-validation>

                    <v-container>
                        <v-layout row wrap>
                            <v-flex sm4>
                                <v-select
                                        v-model="select"
                                        :items="items"
                                        :rules="[v => !!v || 'Item is required']"
                                        label="Select Item Type"
                                        required
                                ></v-select>

                                <v-text-field
                                        v-model="name"
                                        :rules="nameRules"
                                        :counter="10"
                                        label="Name"
                                        required
                                ></v-text-field>

                                <v-select
                                        v-model="select_item_size"
                                        :items="item_sizes"
                                        :rules="[v => !!v || 'Item is required']"
                                        label="Item Size"
                                        required
                                ></v-select>

                                <v-layout row v-if="selected_item_sizes.length>0">
                                    <v-flex xs12 sm8>
                                        <v-card>

                                            <v-list two-line subheader>
                                                <h3>Item Size Selected</h3>

                                                <v-list-tile
                                                        v-for="(size, s) in selected_item_sizes"
                                                        :key="s"
                                                        avatar
                                                        @click=""
                                                >

                                                    <v-list-tile-content>
                                                        <v-list-tile-title>{{ size.text }}</v-list-tile-title>
                                                        <v-list-tile-sub-title>{{ size.price }}</v-list-tile-sub-title>
                                                    </v-list-tile-content>

                                                    <v-list-tile-action>
                                                        <v-btn icon ripple @click.stop="selected_item_sizes.splice(s,1)">
                                                            <v-icon color="grey lighten-1">remove_circle</v-icon>
                                                        </v-btn>
                                                    </v-list-tile-action>
                                                </v-list-tile>

                                                <v-divider inset></v-divider>
                                            </v-list>
                                        </v-card>
                                    </v-flex>
                                </v-layout>
                                <v-btn
                                        :disabled="!valid"
                                        @click="submit"
                                >
                                    submit
                                </v-btn>
                                <v-btn @click="clear">clear</v-btn>
                                <v-btn @click.native="dialog=!dialog">{{ item_image ? 'Change Image' : 'Upload Image'}}</v-btn>
                            </v-flex>
                            <v-flex sm4>
                                <img :src="item_image">
                            </v-flex>
                        </v-layout>

                    </v-container>

                </v-form>
            </v-card>
        </v-container>
        <v-dialog v-model="dialog" persistent max-width="800">
            <v-card>
                <v-card-title>
                    <h2>Upload Image</h2>

                </v-card-title>
                <v-divider></v-divider>
                <v-card-media>
                    <v-container>
                        <v-layout row wrap justify-center>



                                <croppa v-model="myCroppa"
                                        :width="parseInt(image_height)"
                                        :height="parseInt(image_height)"
                                        :prevent-white-space="true"
                                        @file-choose="validImage=true"
                                        @image-remove="validImage=false"
                                ></croppa>

                        </v-layout>
                        <v-layout row wrap justify-center>
                            <v-flex sm12>
                                <v-flex xs12>
                                    <v-slider
                                       :disabled="!validImage"
                                       v-model="image_height"
                                       max="500"
                                       min="100"
                                    ></v-slider>
                                </v-flex>

                            </v-flex>
                        </v-layout>
                    </v-container>

                </v-card-media>
                <v-card-actions>
                    <v-spacer></v-spacer>
                    <v-btn flat @click.native="dialog = false">Close</v-btn>
                    <v-btn :disabled="!validImage" flat @click.native="uploadCroppedImage">OK</v-btn>
                </v-card-actions>
            </v-card>
        </v-dialog>
    </v-app>
</template>

<script>
    export default {
        data(){
            return{
                validImage: false,
                dialog: false,
                valid: false,
                text: 'Form',
                select: 1,
                items: [
                    { text: 'Single Item', value: 1 },
                    { text: 'Item Set', value: 2 }
                ],
                select_item_size: 1,
                item_sizes:[
                    { text: 'Small', value: 1},
                    { text: 'Middle', value: 2},
                    { text: 'Large', value: 3}
                ],
                selected_item_sizes:[],
                name: '',
                nameRules: [
                    v => !!v || 'Name is required',
                    v => (v && v.length <= 10) || 'Name must be less than 10 characters'
                ],
                email: '',
                emailRules: [
                    v => !!v || 'E-mail is required',
                    v => /.+@.+/.test(v) || 'E-mail must be valid'
                ],
                myCroppa: {},
                item_image: '',
                image_width: 250,
                image_height: 150
            }
        },
        methods:{
            submit () {
                if (this.$refs.form.validate()) {
                    // Native form submission is not yet supported
                    axios.post('/api/submit', {
                        name: this.name,
                        email: this.email,
                        select: this.select,
                        checkbox: this.checkbox
                    })
                }
            },
            clear () {
                this.$refs.form.reset()
            },
            onDraw: function(ctx){
                ctx.save()
                ctx.globaleAlpha = 0.7
                ctx.drawImage(document.querySelector('.addon'), 400, 400, 400, 400)
                ctx.restore()
            },
            uploadCroppedImage() {

                this.myCroppa.generateBlob((blob) => {

                    var url = URL.createObjectURL(blob)

                    this.item_image = url

                    this.dialog = !this.dialog

                }, 'image/jpeg', 0.8) // 80% compressed jpeg file
            }
        },
        watch:{

            select_item_size(){

                var vm = this

                vm.selected_item_sizes.push({text: 'Small', price: 1})

            },
            image_height(){
                if(this.image_height.length == 0){
                    this.image_height = 1
                    return false
                }
            }
        }
    }
</script>