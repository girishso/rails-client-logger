module RailsClientLogger
  class RailsClientLoggersController < ApplicationController
    def log
      if %w(debug info warn error fatal).include?(params[:level].to_s)
        level = params[:level].to_s.to_sym
        Rails.logger.send(level, params[:message])
        if defined? ExceptionNotifier
          ExceptionNotifier.notify_exception(Exception.new(params[:message]), env: request.env) if level == :fatal or level == :error
        end
        head :ok
      else
        head :bad_request
      end
    end

    def log_params
      params.permit(:level, :message)
    end
  end
end
