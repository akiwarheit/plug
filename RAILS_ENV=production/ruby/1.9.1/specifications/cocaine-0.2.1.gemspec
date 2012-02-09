# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{cocaine}
  s.version = "0.2.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jon Yurek"]
  s.date = %q{2011-12-13}
  s.description = %q{A small library for doing (command) lines}
  s.email = %q{jyurek@thoughtbot.com}
  s.files = ["spec/cocaine/command_line_spec.rb", "spec/spec_helper.rb", "spec/support/stub_os.rb", "spec/support/with_exitstatus.rb"]
  s.homepage = %q{http://www.thoughtbot.com/projects/cocaine}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{A small library for doing (command) lines}
  s.test_files = ["spec/cocaine/command_line_spec.rb", "spec/spec_helper.rb", "spec/support/stub_os.rb", "spec/support/with_exitstatus.rb"]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<bourne>, [">= 0"])
      s.add_development_dependency(%q<mocha>, [">= 0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
    else
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<bourne>, [">= 0"])
      s.add_dependency(%q<mocha>, [">= 0"])
      s.add_dependency(%q<rake>, [">= 0"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<bourne>, [">= 0"])
    s.add_dependency(%q<mocha>, [">= 0"])
    s.add_dependency(%q<rake>, [">= 0"])
  end
end
