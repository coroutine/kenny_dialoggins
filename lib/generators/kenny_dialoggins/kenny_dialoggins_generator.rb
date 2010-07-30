require "rails/generators"


class KennyDialogginsGenerator < Rails::Generators::Base

  # This call establishes the path to the templates directory.
  #
  def self.source_root 
    File.join(File.dirname(__FILE__), "templates")
  end


  # This method copies stylesheet and javascript files to the 
  # corresponding public directories.
  #
  def generate_assets
    copy_file "kenny_dialoggins.css", "public/stylesheets/kenny_dialoggins.css"
    copy_file "kenny_dialoggins.js",  "public/javascripts/kenny_dialoggins.js"
  end
  
end