window.jsLoggerBasePath ||= ''
window.jsLoggerUrl ||= "/logger/rails_client_logger/log"

window.jsLogger =
  invoke: (level, message) ->
    jQuery.ajax {
      type: 'post'
      beforeSend: (xhr) ->
        xhr.setRequestHeader('X-CSRF-Token', jQuery('meta[name="csrf-token"]').attr('content'))
      data: {level: level, message: message}
      complete: (request) ->
        # Nothing yet
      url: "" + window.jsLoggerBasePath + window.jsLoggerUrl
    }

  debug: (message) ->
        @invoke('debug', message)

  info: (message) ->
        @invoke('info', message)

  warn: (message) ->
        @invoke('warn', message)

  error: (message) ->
        @invoke('error', message)

  fatal: (message) ->
        @invoke('fatal', message)

