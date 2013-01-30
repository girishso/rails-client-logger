Rails.application.routes.draw do

  mount JsLogger::Engine => "/js-logger"
end
