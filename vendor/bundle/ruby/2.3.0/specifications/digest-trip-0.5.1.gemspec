# -*- encoding: utf-8 -*-
# stub: digest-trip 0.5.1 ruby lib

Gem::Specification.new do |s|
  s.name = "digest-trip"
  s.version = "0.5.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Beyond"]
  s.date = "2013-03-31"
  s.description = " password digest for 2channel aka trip "
  s.email = ["beyond@be.go"]
  s.homepage = "https://github.com/beyond/digest-trip"
  s.rubygems_version = "2.5.1"
  s.summary = "password digest for 2channel aka trip"

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
    else
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<rake>, [">= 0"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<rake>, [">= 0"])
  end
end
