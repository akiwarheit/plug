# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{em-http-request}
  s.version = "0.3.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ilya Grigorik"]
  s.date = %q{2011-01-15}
  s.description = %q{EventMachine based, async HTTP Request client}
  s.email = ["ilya@igvita.com"]
  s.extensions = ["ext/buffer/extconf.rb", "ext/http11_client/extconf.rb"]
  s.files = ["spec/encoding_spec.rb", "spec/fixtures/google.ca", "spec/helper.rb", "spec/mock_spec.rb", "spec/multi_spec.rb", "spec/request_spec.rb", "spec/stallion.rb", "spec/stub_server.rb", "ext/buffer/extconf.rb", "ext/http11_client/extconf.rb"]
  s.homepage = %q{http://github.com/igrigorik/em-http-request}
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{em-http-request}
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{EventMachine based, async HTTP Request client}
  s.test_files = ["spec/encoding_spec.rb", "spec/fixtures/google.ca", "spec/helper.rb", "spec/mock_spec.rb", "spec/multi_spec.rb", "spec/request_spec.rb", "spec/stallion.rb", "spec/stub_server.rb"]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<eventmachine>, [">= 0.12.9"])
      s.add_runtime_dependency(%q<addressable>, [">= 2.0.0"])
      s.add_runtime_dependency(%q<escape_utils>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<em-websocket>, [">= 0"])
      s.add_development_dependency(%q<rack>, [">= 0"])
      s.add_development_dependency(%q<mongrel>, ["~> 1.2.0.pre2"])
    else
      s.add_dependency(%q<eventmachine>, [">= 0.12.9"])
      s.add_dependency(%q<addressable>, [">= 2.0.0"])
      s.add_dependency(%q<escape_utils>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<em-websocket>, [">= 0"])
      s.add_dependency(%q<rack>, [">= 0"])
      s.add_dependency(%q<mongrel>, ["~> 1.2.0.pre2"])
    end
  else
    s.add_dependency(%q<eventmachine>, [">= 0.12.9"])
    s.add_dependency(%q<addressable>, [">= 2.0.0"])
    s.add_dependency(%q<escape_utils>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<em-websocket>, [">= 0"])
    s.add_dependency(%q<rack>, [">= 0"])
    s.add_dependency(%q<mongrel>, ["~> 1.2.0.pre2"])
  end
end
