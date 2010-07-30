class KennyDialogginsGenerator < Rails::Generator::Base

  # This method copies stylesheet and javascript files to the 
  # corresponding public directories.
  #
  def manifest
    record do |m|
      m.file "kenny_dialoggins.js", "public/javascripts/kenny_dialoggins.js"
      m.file "kenny_dialoggins.css", "public/stylesheets/kenny_dialoggins.css"
    end
  end
end