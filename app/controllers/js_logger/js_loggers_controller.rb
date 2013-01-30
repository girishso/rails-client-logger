module JsLogger
  class JsLoggersController < ApplicationController
    def log
      if %w(debug info warn error fatal).include?(params[:type].to_s)
        Rails.logger.send(params[:type].to_s.to_sym, params[:message])
        head :ok
      else
        head :bad_request
      end
    end
  end
end
