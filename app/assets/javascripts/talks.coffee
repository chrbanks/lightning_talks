$(document).on 'turbolinks:load', ->
  $('.tagsinput').tagsinput
    tagClass: 'fill-lighten1'
    maxTags: 5


@onLoadEditTalkPage = ->

  class ProgressBar
    constructor: ($bar) ->
      @bar = $bar

    hide: ->
      @bar.addClass 'hidden'

    show: ->
      @bar.removeClass 'hidden'

    reset: ->
      @bar.find('.progress')
          .removeClass('progress-fail')
          .addClass('progress-success')
          .css('width', '0%')

    update: (progress) ->
      @bar.find('.progress').css('width', progress + '%')


  class TalkForm
    constructor: ($form) ->
      @form = $form
      @submitButton = $form.find('[type="submit"]')
      @progressBar = new ProgressBar($('.progress-bar'))
      @bindEvents()

    bindEvents: ->
      @form.find('#upload-slides').on 'click', =>
        @form.find('#talk_attachment').trigger 'click'

    clean: ->
      $mediaBody = @form.find('.attachment-section')
      $mediaBody.find('.error-message').remove()
      $mediaBody.find('.file-info').remove()
      @progressBar.hide()
      @progressBar.reset()
      @submitButton.prop 'disabled', false

    renderError: (error) ->
      $error = $('<small></small>').addClass('error-message')
                                   .text(error)
      @form.find('.attachment-section').append $error

    updateFileUploadProgress: (progress) ->
      @progressBar.update progress

    showFileUploadProgress: ->
      @submitButton.prop 'disabled', true
      @progressBar.show()

    refreshAfterFileUpload: (fileUrl, fileName, fileSize) ->
      @progressBar.hide()
      @progressBar.reset()

      messageText = "#{fileName} #{(fileSize/1024).toFixed(2)} KB"
      $message = $('<p></p>').addClass('file-info small pad0y')
                             .text(messageText)
      @form.find('.attachment-section').append $message

      $input = $('<input />',
        type:'hidden'
        name: @form.find('input:file').attr('name')
        value: fileUrl
      )
      @form.append $input

      @submitButton.prop 'disabled', false


  $('.edit-talk').find('input:file').each (i, elem) ->
    $fileInput = $(elem)
    $form = $($fileInput.parents('form:first'))
    form = new TalkForm($form)

    $fileInput.fileupload(
      fileInput:         $fileInput
      url:               $form.data('url')
      type:              'POST'
      autoUpload:        true
      formData:          $form.data('form-data')
      paramName:         'file'
      dataType:          'XML'
      disableValidation: false
      acceptFileTypes:   /(\.|\/)(pdf|ppt|key)$/i
      maxFileSize:       5242880 # 5 MB
      messages:
        maxFileSize:     'File is too large (should be < 5MB)'
        acceptFileTypes: 'File type not allowed (only .pdf, .ppt, .key)'
      dropZone:          $('#attachment-section')

    ).on('fileuploadstart', (e, data) ->
      form.clean()
      form.showFileUploadProgress()

    ).on('fileuploaddone', (e, data) ->
      # extract key and generate URL from response
      key   = $(data.jqXHR.responseXML).find('Key').text()
      url   = "https://#{$form.data('host')}/#{key}"
      fileData = data.files[0]

      form.refreshAfterFileUpload url, fileData.name, fileData.size

    ).on('fileuploadprocessfail', (e, data) ->
      form.clean()
      $.each data.files, (_, file) ->
        form.renderError(file.error)

    ).on 'fileuploadprogressall', (e, data) ->
      progress = parseInt(data.loaded / data.total * 100, 10)
      form.updateFileUploadProgress progress
