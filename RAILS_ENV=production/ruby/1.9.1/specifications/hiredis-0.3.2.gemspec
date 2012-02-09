# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{hiredis}
  s.version = "0.3.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Pieter Noordhuis"]
  s.date = %q{2011-05-17}
  s.description = %q{Ruby extension that wraps Hiredis (blocking connection and reply parsing)}
  s.email = ["pcnoordhuis@gmail.com"]
  s.extensions = ["ext/hiredis_ext/extconf.rb"]
  s.files = ["ext/hiredis_ext/extconf.rb"]
  s.homepage = %q{http://github.com/pietern/hiredis-rb}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{Ruby extension that wraps Hiredis (blocking connection and reply parsing)}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rake-compiler>, ["~> 0.7.1"])
    else
      s.add_dependency(%q<rake-compiler>, ["~> 0.7.1"])
    end
  else
    s.add_dependency(%q<rake-compiler>, ["~> 0.7.1"])
  end
end
