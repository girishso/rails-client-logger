class JsLoggerGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)
  
  desc "inserts required routes and requires the javascript files"
  def generate
    # add route
    route(%Q{mount JsLogger::Engine, :at => "logger"})
    
    # add to application.js manifest
    original_js = File.binread("app/assets/javascripts/application.js")
    if original_js.include?("require 'js_logger'")
       say_status("skipped", "insert into app/assets/javascripts/application.js", :yellow)
    else
       insert_into_file "app/assets/javascripts/application.js", :after => %r{//= require ['"]?jquery['"]?\s*$} do
          "\n//= require js_logger"
       end
    end
  end
end
