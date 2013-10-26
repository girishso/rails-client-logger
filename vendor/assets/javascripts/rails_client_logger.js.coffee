window.jsLogger =
  invoke: (level, message) ->
    jQuery.ajax {
      type: 'post'
      beforeSend: (xhr) ->
        xhr.setRequestHeader('X-CSRF-Token', jQuery('meta[name="csrf-token"]').attr('content'))
      data: {level: level, message: message}
      complete: (request) ->
        # Nothing yet
      url: "/logger/rails_client_logger/log"
    }

for level in ['debug', 'info', 'warn', 'error', 'fatal']
  jsLogger[level] = (msg) ->
    jsLogger.invoke(level, msg)
