<div class="form-row">
    <div class="form-group col">
        <label class="form-label">Name</label>
        <input type="text" class="form-control" onchange="addIngredient('name', event.target.value)">
    </div>
</div>
<div class="form-row">
    <div class="form-group col-sm-10">
        <label class="form-label">Description</label>
        <input type="text" class="form-control" onchange="addIngredient('description', event.target.value)">
    </div>
    <div class="col-sm-1">
        <input type="button" value="x" class="btn btn-danger mt-4" onclick="removeIngredient()">
    </div>
</div>
<div class="form-row">
    <div class="col-sm-1 pull-right">
        <input type="button" value="+" class="btn btn-success" data-toggle="modal" data-target="#ingredient-level">
    </div>
</div>