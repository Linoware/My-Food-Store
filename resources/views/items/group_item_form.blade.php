@extends('layouts.app')

@section('content')
    <div class="card mb-4" style="height: 70px;">
        <div class="card-body">
            <ol class="breadcrumb">
                <li class="breadcrumb-item">
                    <a href="javascript:void(0)">Item</a>
                </li>
                <li class="breadcrumb-item">
                    <a href="javascript:void(0)">Create</a>
                </li>
            </ol>
        </div>
    </div>
    <div class="card mb-3 col-sm-8">
        <h4 class="card-header">
            Create Item Group  <button id="growl-warning" class="btn btn-warning">Warning</button>
        </h4>
        <div class="card-body">
            <form action="/item/store" method="post" enctype="multipart/form-data">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="form-row">
                            <div class="form-group col-md-3 ml-2">
                                <label class="form-label">Item Type</label>
                                <select class="form-control" name="item_type" onchange="changeForm(event.target.value)">
                                    @foreach($item_types as $item_type)
                                        <option <?=$item_type->item_type_id==$_GET['type'] ? 'selected' : ''?> value="{{ $item_type->item_type_id }}">{{ $item_type->item_type_name }}</option>
                                    @endforeach
                                </select>
                            </div>

                        </div>
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
                                    <input type="number" step="0.01" class="form-control" name="item_price">
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label class="form-label">Item Image</label>
                                <div class="fallback">
                                    <input name="file" type="file" multiple name="images[]">
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="row">
                    <div class="form-row col-sm-12">
                        <div class="form-group col-sm-12">
                            <label class="form-label">Item Description</label>
                            <textarea name="item_description" class="form-control" rows="3" ></textarea>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="card col-sm-12">
                        <h6 class="card-header">
                            Ingredient Level
                        </h6>
                        <div class="card-body">
                            <div class="row mb-3">
                                <div class="col-sm-11">
                                    <input type="text" class="form-control">
                                </div>
                                <div class="col-sm-1">
                                    <input type="button" value="+" class="btn btn-success" onclick="addIngredientLevel()">
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
                    </div>
                </div>

            </form>
        </div>
    </div>
    @include('items.script')
@endsection
