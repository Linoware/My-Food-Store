<!-- Modal template -->
<div class="modal modal-top fade" id="{{ $modal_id }}">
    <div class="modal-dialog">
        <form class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">
                    {{ $title }}
                </h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">×</button>
            </div>
            <div class="modal-body">
                <div class="form-row">
                    <div class="form-group col">
                        <label class="form-label">Card number</label>
                        <input type="text" class="form-control" placeholder="XXXX XXXX XXXX XXXX">
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col mb-0">
                        <label class="form-label">Expiration date</label>
                        <input type="text" class="form-control" placeholder="DD / MM">
                    </div>
                    <div class="form-group col mb-0">
                        <label class="form-label">Card holder</label>
                        <input type="text" class="form-control" placeholder="Name on card">
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save</button>
            </div>
        </form>
    </div>
</div>