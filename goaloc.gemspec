Gem::Specification.new do |s|
  s.name = %q{goaloc}
  s.version = "0.2.10"
 
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["matt knox"]
  s.date = %q{2008-11-14}
  s.description = %q{Generate On A Lot of Crack speeds and extends the early sketching phase of RESTFUL MVC app development }
  s.email = %q{matthewknox@gmail.com}
  s.homepage = %q{http://github.com/mattknox/goaloc}
  s.require_paths = ["lib"]
  s.files = ["bin/bashRake.rb", "bin/goaloc", "config/hoe.rb", "config/requirements.rb", "doc/route_usage", "goaloc.gemspec", "History.txt", "lib/goaloc/app.rb", "lib/goaloc/generators/generator.rb", "lib/goaloc/generators/merb/controller.rb.erb", "lib/goaloc/generators/merb/model.rb.erb", "lib/goaloc/generators/merb/router.rb.erb", "lib/goaloc/generators/merb.rb", "lib/goaloc/generators/rails/_form.html.erb", "lib/goaloc/generators/rails/controller.rb.erb", "lib/goaloc/generators/rails/index.html.erb", "lib/goaloc/generators/rails/show.html.erb", "lib/goaloc/generators/rails/migration.rb.erb", "lib/goaloc/generators/rails/model.rb.erb", "lib/goaloc/generators/rails.rb", "lib/goaloc/model.rb", "lib/goaloc/version.rb", "lib/goaloc.rb", "LICENSE", "Manifest.txt", "PostInstall.txt", "Rakefile", "README", "script/destroy", "script/generate", "script/txt2html", "setup.rb", "tasks/deployment.rake", "tasks/environment.rake", "tasks/website.rake", "test/goaloc_test.rb", "test/test_goaloc.rb", "test/test_goaloc_a.rb", "test/test_goaloc_b.rb", "test/test_helper.rb"]
  s.executables = ["goaloc"]
  s.rubygems_version = %q{1.2.0}
  s.summary = %q{ this allows for rapid, console-based generation of merb or rails apps}
 
  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2
 
    if current_version >= 3 then
    else
    end
  else
  end
end