# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{kenny_dialoggins}
  s.version = "1.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Coroutine", "Tim Lowrimore", "John Dugan"]
  s.date = %q{2010-10-18}
  s.description = %q{Kenny Dialoggins allows you to include scriptaculous dialogs in Rails applications using the same syntax employed for rendering partials.}
  s.email = %q{gems@coroutine.com}
  s.extra_rdoc_files = [
    "README.rdoc"
  ]
  s.files = [
    ".gitignore",
     ".specification",
     "MIT-LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "generators/kenny_dialoggins/kenny_dialoggins_generator.rb",
     "generators/kenny_dialoggins/templates/kenny_dialoggins.css",
     "generators/kenny_dialoggins/templates/kenny_dialoggins.js",
     "init.rb",
     "kenny_dialoggins.gemspec",
     "lib/generators/kenny_dialoggins/kenny_dialoggins_generator.rb",
     "lib/generators/kenny_dialoggins/templates/kenny_dialoggins.css",
     "lib/generators/kenny_dialoggins/templates/kenny_dialoggins.js",
     "lib/kenny_dialoggins.rb",
     "lib/kenny_dialoggins/helpers.rb",
     "rails/init.rb",
     "test/kenny_dialoggins/helpers_test.rb",
     "test/test_helper.rb"
  ]
  s.homepage = %q{http://github.com/coroutine/kenny_dialoggins}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Dead simple, beautiful dialogs for Rails.}
  s.test_files = [
    "test/kenny_dialoggins/helpers_test.rb",
     "test/test_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<actionpack>, [">= 2.3.4"])
      s.add_development_dependency(%q<activesupport>, [">= 2.3.4"])
    else
      s.add_dependency(%q<actionpack>, [">= 2.3.4"])
      s.add_dependency(%q<activesupport>, [">= 2.3.4"])
    end
  else
    s.add_dependency(%q<actionpack>, [">= 2.3.4"])
    s.add_dependency(%q<activesupport>, [">= 2.3.4"])
  end
end

