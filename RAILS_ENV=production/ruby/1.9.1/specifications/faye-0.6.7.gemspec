# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{faye}
  s.version = "0.6.7"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["James Coglan"]
  s.date = %q{2011-10-20}
  s.email = %q{jcoglan@gmail.com}
  s.homepage = %q{http://faye.jcoglan.com}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{Simple pub/sub messaging for the web}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<eventmachine>, ["~> 0.12.0"])
      s.add_runtime_dependency(%q<em-http-request>, ["~> 0.3"])
      s.add_runtime_dependency(%q<em-hiredis>, [">= 0.0.1"])
      s.add_runtime_dependency(%q<json>, [">= 1.0"])
      s.add_runtime_dependency(%q<thin>, ["~> 1.2"])
      s.add_runtime_dependency(%q<rack>, [">= 1.0"])
      s.add_development_dependency(%q<jake>, [">= 0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<rspec>, ["~> 2.5.0"])
      s.add_development_dependency(%q<rack-proxy>, [">= 0"])
      s.add_development_dependency(%q<rack-test>, [">= 0"])
      s.add_development_dependency(%q<RedCloth>, ["~> 3.0.0"])
      s.add_development_dependency(%q<sinatra>, [">= 0"])
      s.add_development_dependency(%q<staticmatic>, [">= 0"])
    else
      s.add_dependency(%q<eventmachine>, ["~> 0.12.0"])
      s.add_dependency(%q<em-http-request>, ["~> 0.3"])
      s.add_dependency(%q<em-hiredis>, [">= 0.0.1"])
      s.add_dependency(%q<json>, [">= 1.0"])
      s.add_dependency(%q<thin>, ["~> 1.2"])
      s.add_dependency(%q<rack>, [">= 1.0"])
      s.add_dependency(%q<jake>, [">= 0"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<rspec>, ["~> 2.5.0"])
      s.add_dependency(%q<rack-proxy>, [">= 0"])
      s.add_dependency(%q<rack-test>, [">= 0"])
      s.add_dependency(%q<RedCloth>, ["~> 3.0.0"])
      s.add_dependency(%q<sinatra>, [">= 0"])
      s.add_dependency(%q<staticmatic>, [">= 0"])
    end
  else
    s.add_dependency(%q<eventmachine>, ["~> 0.12.0"])
    s.add_dependency(%q<em-http-request>, ["~> 0.3"])
    s.add_dependency(%q<em-hiredis>, [">= 0.0.1"])
    s.add_dependency(%q<json>, [">= 1.0"])
    s.add_dependency(%q<thin>, ["~> 1.2"])
    s.add_dependency(%q<rack>, [">= 1.0"])
    s.add_dependency(%q<jake>, [">= 0"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<rspec>, ["~> 2.5.0"])
    s.add_dependency(%q<rack-proxy>, [">= 0"])
    s.add_dependency(%q<rack-test>, [">= 0"])
    s.add_dependency(%q<RedCloth>, ["~> 3.0.0"])
    s.add_dependency(%q<sinatra>, [">= 0"])
    s.add_dependency(%q<staticmatic>, [">= 0"])
  end
end
