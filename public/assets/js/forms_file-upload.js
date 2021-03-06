// Dropzone
$(function() {
  $('#dropzone-demo').dropzone({
    parallelUploads: 2,
    maxFilesize:     50000,
    filesizeBase:    1000,
    addRemoveLinks:  true,
  });

  // Mock the file upload progress (only for the demo)
  //
  Dropzone.prototype.uploadFiles = function(files) {
    alert(files)
    var minSteps         = 6;
    var maxSteps         = 60;
    var timeBetweenSteps = 100;
    var bytesPerStep     = 100000;
    var isUploadSuccess  = Math.round(Math.random());

    var self = this;

    for (var i = 0; i < files.length; i++) {

      var file = files[i];
      var totalSteps = Math.round(Math.min(maxSteps, Math.max(minSteps, file.size / bytesPerStep)));

      for (var step = 0; step < totalSteps; step++) {
        var duration = timeBetweenSteps * (step + 1);

        setTimeout(function(file, totalSteps, step) {
          return function() {
            file.upload = {
              progress: 100 * (step + 1) / totalSteps,
              total: file.size,
              bytesSent: (step + 1) * file.size / totalSteps
            };

            self.emit('uploadprogress', file, file.upload.progress, file.upload.bytesSent);
            if (file.upload.progress == 100) {

              if (isUploadSuccess) {
                file.status =  Dropzone.SUCCESS;
                self.emit('success', file, 'success', null);
              } else {
                file.status =  Dropzone.ERROR;
                self.emit('error', file, 'Some upload error', null);
              }

              self.emit('complete', file);
              self.processQueue();
            }
          };
        }(file, totalSteps, step), duration);
      }
    }
  };
});
