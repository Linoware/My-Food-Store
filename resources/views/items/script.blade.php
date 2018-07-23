<script>
    var isRtl = $('body').attr('dir') === 'rtl' || $('html').attr('dir') === 'rtl';
    var item_price_id = 0, ingredient_level_id = 0, ingredient_materials = 0,item_prices = [], ingredient_levels = [], ingredient_materials = [];

    changeForm('<?=Session::get('item_type')['type'] ? Session::get('item_type')['type'] : 1?>', 0);

    function addItemPrice(){

        var size_name = $('#item-price-size-list option:selected').text(), size_id = $('#item-price-size-list option:selected').val(), existed = 0;

        axios.post('/item/add_info',
        {
            type: 'pricing', data: {
                item_size: size_name,
                item_size_id: size_id,
                item_price: 0
            }
        })
        .then((res)=>{
            if(res.data.status == false){
                $.growl.error({
                    message:  'Item Size Already Added, Please choose another!!!',
                    location: isRtl ? 'tl' : 'br'
                });
            }else{
                $('#form-container .card-body').html(res.data);
            }

        })

        // var item_price_size_list = $('#item-price-size-list option:selected').text(), val = $('#item-price-size-list option:selected').val(), existed = 0;
        //
        // item_prices.forEach(function(v,i){
        //
        //     if( v.item_size == item_price_size_list ){
        //
        //         existed = 1;
        //         return false;
        //     }
        //
        // });
        //
        // if(existed==0){
        //     item_prices.push({ id: item_price_id,size_id: val, item_size: item_price_size_list, price: 0 });
        //     $('#item-price-size').append('' +
        //         '<div class="row mb-2" id="'+item_price_id+'">' +
        //         '<div class="col-sm-5">' +
        //         '<input type="text" value="'+val+'" hidden><span>'+ item_price_size_list  + '</span>' +
        //         '</div>' +
        //         '<div class="col-sm-5">' +
        //         '<input type="number" step="0.01" name="item_price_size[]" onkeyup="getItemPriceSizeValue(' + item_price_id + ', event.target.value)">' +
        //         '</div>' +
        //         '<div class="col-sm-1" size="sm">' +
        //         '<input type="button" value="x" class="btn btn-danger" onclick="remove('+item_price_id+')" style="height: 27px; padding: 0px 15px 5px 15px;"> ' +
        //         '</div> ' +
        //         '</div>' +
        //         '');
        //
        //     item_price_id = item_price_id+1
        // }else{
        //     $.growl.error({
        //         message:  'Item Size Alread Added, Please choose another!!!',
        //         location: isRtl ? 'tl' : 'br'
        //     });
        // }

    }

    function addItemInfo(type, value){
        axios.post('/item/add_info',
            {
                type: 'info', data: {
                    item_name: value
                }
            })
            .then((res)=>{

                $('#form-container .card-body').html(res.data);

            })
    }

    function uploadImage(act, input){

        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                axios.post('/item/add_info',
                    {
                        type: 'image', data: {
                            action: act,
                            item_image: e.target.result
                        }
                    })
                    .then((res)=>{

                        $('#form-container .card-body').html(res.data);

                    })
            };

            reader.readAsDataURL(input.files[0]);
        }else{
            axios.post('/item/add_info',
                {
                    type: 'image', data: {
                        action: act,
                        item_image: ''
                    }
                })
                .then((res)=>{

                    $('#form-container .card-body').html(res.data);

                })
        }
    }

    function removeItemSizePrice(key){
        axios.post('/item/remove_item_price',
            {
                key: key
            })
            .then((res)=>{
                $('#form-container .card-body').html(res.data);
            })
    }

    function editPrice(key,price){
        axios.post('/item/edit_item_price',
            {
                key: key,
                price: price
            })
            .then((res)=>{

                $('#form-container .card-body').html(res.data);
            })
    }

    function changeForm(type, clear){
        axios.post('/item/change_form', {type: type, clear: clear}).then((res)=>{
            $('#form-container .card-body').html(res.data);
        })
    }

    function addIngredientLevel(){
        $('#ingredient-levels tbody').append('' +
            '<tr>' +
            '<td>Crust</td><td>Thin & Crispy</td><td><input type="checkbox" checked value="1"> </td>' +
            '</tr>');
    }
</script>