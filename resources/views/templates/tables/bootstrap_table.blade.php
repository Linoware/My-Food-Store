
<div class="container-fluid flex-grow-1 container-p-y">

        <h4 class="font-weight-bold py-3 mb-4">
            <span class="text-muted font-weight-light">Tables /</span> Bootstrap table
        </h4>

        <div id="bootstrap-table-toolbar">
            <button id="bootstrap-table-remove" class="btn btn-danger" disabled>
                <i class="ion ion-md-close"></i> Delete
            </button>
        </div>

        <table id="bootstrap-table-example" data-toolbar="#bootstrap-table-toolbar" data-search="true" data-show-refresh="true" data-show-columns="true" data-show-export="true" data-detail-view="true" data-minimum-count-columns="2" data-show-pagination-switch="true"
               data-pagination="true" data-id-field="id" data-show-footer="true" data-url="{{ asset('assets/json/bootstrap-table-data.json') }}">
        </table>

</div>


