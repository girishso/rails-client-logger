class RailsClientLoggerGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  desc "inserts required routes and requires the javascript files"
  def generate
    # add route
    route(%Q{mount RailsClientLogger::Engine, :at => "logger"})

    mode = :coffee
    if File.exists? "app/assets/javascripts/application.js.coffee"
      path = "app/assets/javascripts/application.js.coffee"
    elsif File.exists? "app/assets/javascripts/application.coffee"
      path = "app/assets/javascripts/application.coffee"
    elsif File.exists? "app/assets/javascripts/application.js"
      mode = :js
      path = "app/assets/javascripts/application.js"
    end

    # add to application.js manifest
    original = File.binread(path)
    if original.include?("require rails_client_logger")
       say_status("skipped", "insert into #{path}", :yellow)
    else
      if mode == :coffee
        insert_into_file path, :after => %r{#= require ['"]?jquery['"]?\s*$} do
          "\n#= require rails_client_logger"
        end
      else
        insert_into_file path, :after => %r{//= require ['"]?jquery['"]?\s*$} do
          "\n//= require rails_client_logger"
        end
      end
    end
  end
end
