(function( JSLogger, $, undefined ) {
    //Public Method
    JSLogger.debug = function(message) {
			invoke('debug', message);
    };

    JSLogger.info = function(message) {
			invoke('info', message);
    };

    JSLogger.warn = function(message) {
			invoke('warn', message);
    };

    JSLogger.error = function(message) {
			invoke('error', message);
    };

    JSLogger.fatal = function(message) {
			invoke('fatal', message);
    };

     
    //Private Method
    function invoke(type, message) {
			$.ajax({
			  type: 'post',
				beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
			  data: {type: type, message: message},
			  complete: function(request){},
			  url: "/logger/js_logger/log"
			})
    }   
}( window.JSLogger = window.JSLogger || {}, jQuery ));