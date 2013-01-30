JsLogger::Engine.routes.draw do
  resource :js_logger, :only => [] do
    member do
      post 'log'
    end
  end
end
