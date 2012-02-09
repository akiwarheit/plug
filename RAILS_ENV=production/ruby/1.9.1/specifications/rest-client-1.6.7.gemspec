# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{rest-client}
  s.version = "1.6.7"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Adam Wiggins", "Julien Kirch"]
  s.date = %q{2011-08-24}
  s.default_executable = %q{restclient}
  s.description = %q{A simple HTTP and REST client for Ruby, inspired by the Sinatra microframework style of specifying actions: get, put, post, delete.}
  s.email = %q{rest.client@librelist.com}
  s.executables = ["restclient"]
  s.files = ["spec/abstract_response_spec.rb", "spec/base.rb", "spec/exceptions_spec.rb", "spec/integration/certs/equifax.crt", "spec/integration/certs/verisign.crt", "spec/integration/request_spec.rb", "spec/integration_spec.rb", "spec/master_shake.jpg", "spec/payload_spec.rb", "spec/raw_response_spec.rb", "spec/request2_spec.rb", "spec/request_spec.rb", "spec/resource_spec.rb", "spec/response_spec.rb", "spec/restclient_spec.rb", "bin/restclient"]
  s.homepage = %q{http://github.com/archiloque/rest-client}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{Simple HTTP and REST client for Ruby, inspired by microframework syntax for specifying actions.}
  s.test_files = ["spec/abstract_response_spec.rb", "spec/base.rb", "spec/exceptions_spec.rb", "spec/integration/certs/equifax.crt", "spec/integration/certs/verisign.crt", "spec/integration/request_spec.rb", "spec/integration_spec.rb", "spec/master_shake.jpg", "spec/payload_spec.rb", "spec/raw_response_spec.rb", "spec/request2_spec.rb", "spec/request_spec.rb", "spec/resource_spec.rb", "spec/response_spec.rb", "spec/restclient_spec.rb"]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<mime-types>, [">= 1.16"])
      s.add_development_dependency(%q<webmock>, [">= 0.9.1"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
    else
      s.add_dependency(%q<mime-types>, [">= 1.16"])
      s.add_dependency(%q<webmock>, [">= 0.9.1"])
      s.add_dependency(%q<rspec>, [">= 0"])
    end
  else
    s.add_dependency(%q<mime-types>, [">= 1.16"])
    s.add_dependency(%q<webmock>, [">= 0.9.1"])
    s.add_dependency(%q<rspec>, [">= 0"])
  end
end
