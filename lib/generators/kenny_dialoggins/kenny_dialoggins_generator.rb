class KennyDialogginsGenerator < Rails::Generator::Base

  # This method establishes the path to the templates directory.
  #
  def self.source_root
    @source_root ||= File.expand_path('../templates', __FILE__)
  end


  # This method copies stylesheet and javascript files to the 
  # corresponding public directories.
  #
  def copy_assets
    copy_file "kenny_dialoggins.js",  "public/javascripts/kenny_dialoggins.js"
    copy_file "kenny_dialoggins.css", "public/stylesheets/kenny_dialoggins.css"
  end
  
end