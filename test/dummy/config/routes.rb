Rails.application.routes.draw do

  mount RailsClientLogger::Engine => "/js-logger"
end
