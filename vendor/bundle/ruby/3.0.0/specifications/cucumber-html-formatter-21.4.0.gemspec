# -*- encoding: utf-8 -*-
# stub: cucumber-html-formatter 21.4.0 ruby lib

Gem::Specification.new do |s|
  s.name = "cucumber-html-formatter".freeze
  s.version = "21.4.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 3.0.3".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "bug_tracker_uri" => "https://github.com/cucumber/html-formatter/issues", "changelog_uri" => "https://github.com/cucumber/html-formatter/blob/main/CHANGELOG.md", "documentation_uri" => "https://github.com/cucumber/html-formatter", "homepage_uri" => "https://github.com/cucumber/html-formatter", "mailing_list_uri" => "https://groups.google.com/forum/#!forum/cukes", "source_code_uri" => "https://github.com/cucumber/html-formatter" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Vincent Pr\u00EAtre".freeze]
  s.date = "2024-06-21"
  s.description = "HTML formatter for Cucumber".freeze
  s.email = "cukes@googlegroups.com".freeze
  s.executables = ["cucumber-html-formatter".freeze]
  s.files = ["bin/cucumber-html-formatter".freeze]
  s.homepage = "https://github.com/cucumber/html-formatter".freeze
  s.licenses = ["MIT".freeze]
  s.rdoc_options = ["--charset=UTF-8".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.6".freeze)
  s.rubygems_version = "3.2.3".freeze
  s.summary = "cucumber-html-formatter-21.4.0".freeze

  s.installed_by_version = "3.2.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<cucumber-messages>.freeze, ["> 19", "< 25"])
    s.add_development_dependency(%q<cucumber-compatibility-kit>.freeze, ["~> 14.1"])
    s.add_development_dependency(%q<rake>.freeze, ["~> 13.1"])
    s.add_development_dependency(%q<rspec>.freeze, ["~> 3.12"])
    s.add_development_dependency(%q<rubocop>.freeze, ["~> 1.41.0"])
    s.add_development_dependency(%q<rubocop-rake>.freeze, ["~> 0.6.0"])
    s.add_development_dependency(%q<rubocop-rspec>.freeze, ["~> 2.15.0"])
  else
    s.add_dependency(%q<cucumber-messages>.freeze, ["> 19", "< 25"])
    s.add_dependency(%q<cucumber-compatibility-kit>.freeze, ["~> 14.1"])
    s.add_dependency(%q<rake>.freeze, ["~> 13.1"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.12"])
    s.add_dependency(%q<rubocop>.freeze, ["~> 1.41.0"])
    s.add_dependency(%q<rubocop-rake>.freeze, ["~> 0.6.0"])
    s.add_dependency(%q<rubocop-rspec>.freeze, ["~> 2.15.0"])
  end
end
