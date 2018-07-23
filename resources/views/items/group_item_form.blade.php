<h5 class="card-title">
    Basic & Pricing
</h5>
<hr/>
<form action="/item/store" method="post" enctype="multipart/form-data">
    <div class="row">
        <div class="col-sm-12">
            <div class="form-row">
                <div class="col-sm-6">
                    <div class="form-group col-md-10">
                        <label class="form-label">Item Name</label>
                        <input type="text" class="form-control" name="item_name">
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="form-group col-md-10">
                        <label class="form-label">Item Price</label>
                        <div class="input-group">

                            <input type="number" step="0.01" class="form-control" name="item_price">
                            <div class="input-group-prepend">
                                <span class="input-group-text">$</span>
                            </div>

                        </div>

                    </div>
                </div>
            </div>
            <div class="form-row">
                <div class="col-sm-6">
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

    </div>
    <div class="row">
        <div class="form-row col-sm-12 ml-2">
            <div class="form-group col-sm-12">
                <label class="form-label">Item Description</label>
                <textarea name="item_description" class="form-control" rows="3" ></textarea>
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

</form>