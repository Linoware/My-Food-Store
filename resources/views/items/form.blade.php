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
<div class="card mb-3 col-sm-8" id="form-container">
    <div class="col-sm-12">
        <h4 class="card-header">
            Create Item Group
        </h4>
        <h5 class="card-title mt-3">
            General
        </h5>
        <hr/>
        <div class="col-sm-12">
            <div class="form-row">
                <div class="form-group col-md-3 ml-2">
                    <label class="form-label">Restaurant</label>
                    <select class="form-control" name="item_type" onchange="addItemInfo(event.target.value, 1)">
                        @foreach($brands as $brand)
                            <option <?=$brand->brand_id==Session::get('restaurant') ? 'selected' : ''?> value="{{ $brand->brand_id }}">{{ $brand->brand_name }}</option>
                        @endforeach
                    </select>
                </div>

                <div class="form-group col-md-3 ml-2">
                    <label class="form-label">Item Type</label>
                    <select class="form-control" name="item_type" onchange="changeForm(event.target.value, 1)">
                        @foreach($item_types as $item_type)
                            <option <?=$item_type->item_type_id==Session::get('item_type')['type'] ? 'selected' : ''?> value="{{ $item_type->item_type_id }}">{{ $item_type->item_type_name }}</option>
                        @endforeach
                    </select>
                </div>

            </div>
        </div>

        <hr/>
    </div>

    <div class="card-body"></div>
</div>
    @include('items.modal', array('title' => 'Add Ingredient Levels', 'modal_id' => 'ingredient-level', 'modal_body' => 'items.ingredient_level_form'))
    @include('items.script')
@endsection

