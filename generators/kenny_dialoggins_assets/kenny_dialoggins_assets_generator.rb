class KennyDialogginsAssetsGenerator < Rails::Generator::Base
  def manifest
    record do |m|
      m.file "kenny_dialoggins.js", "public/javascripts/kenny_dialoggins.js"
      m.file "kenny_dialoggins.css", "public/stylesheets/kenny_dialoggins.css"
    end
  end
end