require "rails/generators"


class KennyDialogginsGenerator < Rails::Generator::Base

  # This call establishes the path to the templates directory.
  #
  source_root File.expand_path('../templates', __FILE__)


  # This method copies stylesheet and javascript files to the 
  # corresponding public directories.
  #
  def generate_assets
    copy_file "kenny_dialoggins.js",  "public/javascripts/kenny_dialoggins.js"
    copy_file "kenny_dialoggins.css", "public/stylesheets/kenny_dialoggins.css"
  end
  
end