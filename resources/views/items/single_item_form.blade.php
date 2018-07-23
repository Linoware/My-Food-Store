<h5 class="card-title">
    Basic & Pricing
</h5>
<hr/>
<form action="/item/store" method="post" enctype="multipart/form-data">
    <div class="row">
        <div class="col-sm-6">
            <div class="form-row">
                <div class="col-sm-12">
                    <div class="form-group col-md-10">
                        <label class="form-label">Item Name</label>
                        <input type="text" class="form-control" value="{{ Session::get('item_name') }}" onchange="addItemInfo('info', event.target.value)" name="item_name">
                    </div>
                </div>
            </div>
            <div class="form-row">
                <div class="col-sm-12">
                    <label class="form-label ml-3">Item Image</label><br>
                    <div class="form-group col-md-10 text-center">

                        <label class="form-label" for="item-image">
                            <div class="card" style=" cursor: pointer">
                                <div class="card-body">
                                    @if(Session::get('item_image') == null || '' )
                                        <i class="fas fa-cloud-upload-alt" style="font-size: 40px;"></i><br>
                                        Click To Add Image
                                    @else
                                        <img id="item-image" src="{{ Session::get('item_image') }}" height="100px">

                                    @endif
                                </div>
                                @if(Session::get('item_image') !== null || '' )
                                    <div class="card-footer">
                                        <input type="button" class="btn btn-sm btn-danger col-sm-12" size="sm" value="Remove" onclick="uploadImage(0,'')">
                                    </div>
                                @endif
                            </div>
                        </label>
                        <input name="file" type="file" hidden name="images[]" id="item-image" onchange="uploadImage(1,this)">
                    </div>
                </div>

            </div>
        </div>
        <div class="col-sm-6">
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label class="form-label">Create Item Price By Size</label>
                    <select class="form-control" id="item-price-size-list" name="product_size">
                        @foreach($product_sizes as $product_size)
                            <option value="{{ $product_size->product_size_id }}">{{ $product_size->product_size_name }}</option>
                        @endforeach
                    </select>
                </div>
                <div class="col-sm-1">
                    <input type="button" value="+" class="btn btn-success mt-4" onclick="addItemPrice()">
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <div class="form-group col-md-12">
                        <label class="form-label">Item Price</label>
                        <div class="card">
                            <div class="card-body" id="item-price-size">

                                <?php $item_size_price = Session::get('item_size_price'); ?>
                                @if(!empty($item_size_price))
                                    @foreach($item_size_price as $key => $size_price)
                                    <div class="row mb-2">
                                       <div class="col-sm-5">
                                            <input type="text" value="" hidden><span> {{ $size_price['item_size'] }}  </span>
                                        </div>
                                        <div class="col-sm-5">
                                            <div class="input-group">

                                                <input type="number" step="0.01" class="form-control" value="{{ $size_price['item_price'] }}" onchange="editPrice({{ $key }}, event.target.value)">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text">$</span>
                                                </div>

                                            </div>

                                        </div>
                                        <div class="col-sm-1" size="sm">
                                            <input type="button" value="x" class="btn btn-danger" onclick="removeItemSizePrice({{ $key }})" style="height: 38px; padding: 0px 15px 5px 15px;">
                                         </div>
                                    </div>
                                    @endforeach
                                @endif
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="form-row col-sm-12 ml-2">
            <div class="form-group col-sm-12">
                <label class="form-label">Item Description</label>
                <textarea name="item_description" class="form-control" rows="7" ></textarea>
            </div>
        </div>
    </div>

    <h5 class="card-title mt-3">
        Ingredient
    </h5>
    <hr/>
    <div class="card-body">
        <div class="row mb-3">
            <div class="col-sm-11">
                <label class="control-label">Levels</label>
            </div>
            <div class="col-sm-1">
                <input type="button" value="+" class="btn btn-success" data-toggle="modal" data-target="#ingredient-level">
            </div>
        </div>
        <table class="table data-table table-bordered table-striped" id="ingredient-levels">
            <thead class="thead-dark">
            <tr>
                <th>Ingredient Level</th>
                <th>Ingredient Level Description</th>
                <th>Enable</th>
            </tr>
            </thead>
            <tbody>

            </tbody>
        </table>
    </div>

    <div class="card-body">
        <div class="row mb-3">
            <div class="col-sm-11">
                <label class="control-label">Materials</label>
            </div>
            <div class="col-sm-1">
                <input type="button" value="+" class="btn btn-success" data-toggle="modal" data-target="#ingredient-material">
            </div>
        </div>
        <table class="table data-table table-bordered table-striped" id="ingredient-levels">
            <thead class="thead-dark">
            <tr>
                <th>Ingredient Level</th>
                <th>Ingredient Level Description</th>
                <th>Enable</th>
            </tr>
            </thead>
            <tbody>

            </tbody>
        </table>
    </div>


</form>
@include('items.modal', array('title' => 'Add Ingredient Materials', 'modal_id' => 'ingredient-material'))