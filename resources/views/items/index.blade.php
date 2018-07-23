@extends('layouts.app')

@section('content')
    <div class="card mb-4" style="height: 70px;">
        <div class="card-body">
            <ol class="breadcrumb">
                <li class="breadcrumb-item">
                    <a href="javascript:void(0)">Item</a>
                </li>
                <li class="breadcrumb-item">
                    <a href="javascript:void(0)">List</a>
                </li>
            </ol>
        </div>
    </div>
    <div class="col-sm-3 mb-3">
        <a href="/item/create?type=1" class="btn btn-default pull-left">Create New</a>
    </div>
    {{--@include('templates.tables.bootstrap_table')--}}
    <table class="table data-table table-striped table-bordered">
        <thead class="thead-dark">
            <tr>
                <th>Item Name</th>
                <th>Item Name Natvie</th>
                <th>Item Price</th>
                <th>Item Type</th>
            </tr>
        </thead>
        <tbody>
        @foreach($items as $item)
            <tr>
                <td>{{ $item->item_name }}</td>
                <td>{{ $item->item_name_native }}</td>
                <td>{{ $item->item_price }}</td>
                <td>{{ $item->item_type_name }}</td>
            </tr>
         @endforeach
        </tbody>
    </table>
@endsection