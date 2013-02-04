RailsClientLogger::Engine.routes.draw do
  resource :rails_client_logger, :only => [] do
    member do
      post 'log'
    end
  end
end
