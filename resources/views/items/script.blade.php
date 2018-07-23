<script>
    var isRtl = $('body').attr('dir') === 'rtl' || $('html').attr('dir') === 'rtl';
    var item_price_id = 0, ingredient_level_id = 0, ingredient_materials = 0,item_prices = [], ingredient_levels = [], ingredient_materials = [];
    function addItemPrice(){

        var item_price_size_list = $('#item-price-size-list option:selected').text(), val = $('#item-price-size-list option:selected').val(), existed = 0;

        item_prices.forEach(function(v,i){

            if( v.item_size == item_price_size_list ){

                existed = 1;
                return false;
            }

        });

        if(existed==0){
            item_prices.push({ id: item_price_id,size_id: val, item_size: item_price_size_list, price: 0 });
            $('#item-price-size').append('' +
                '<div class="row mb-2" id="'+item_price_id+'">' +
                '<div class="col-sm-5">' +
                '<input type="text" value="'+val+'" hidden><span>'+ item_price_size_list  + '</span>' +
                '</div>' +
                '<div class="col-sm-5">' +
                '<input type="number" step="0.01" name="item_price_size[]" onkeyup="getItemPriceSizeValue(' + item_price_id + ', event.target.value)">' +
                '</div>' +
                '<div class="col-sm-1" size="sm">' +
                '<input type="button" value="x" class="btn btn-danger" onclick="remove('+item_price_id+')" style="height: 27px; padding: 0px 15px 5px 15px;"> ' +
                '</div> ' +
                '</div>' +
                '');

            item_price_id = item_price_id+1
        }else{
            $.growl.error({
                message:  'Item Size Alread Added, Please choose another!!!',
                location: isRtl ? 'tl' : 'br'
            });
        }

    }

    function remove(id){
        $('#'+id).html('');
    }

    function getItemPriceSizeValue(id,price){
        item_prices.forEach(function(v,i){
            if(v.id == id){
                v.price = price;
                console.log(v.price);
            }
        })
    }

    function changeForm(type){
        window.location.href = '<?=URL::to('/item/create?type=')?>'+type
    }

    function addIngredientLevel(){
        $('#ingredient-levels tbody').append('' +
            '<tr>' +
            '<td>Crust</td><td>Thin & Crispy</td><td><input type="checkbox" checked value="1"> </td>' +
            '</tr>');
    }
</script>