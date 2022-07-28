# frozen_string_literal: true

require_relative "lib/codebreaker/version"

Gem::Specification.new do |spec|
  spec.name = "codebreaker"
  spec.version = CodeBreaker::VERSION
  spec.authors = ["Vladyslav Todorchuk"]
  spec.email = ["vladik.todorchuk.code@gmail.com"]

  spec.summary = "CodeBreaker game."
  spec.description = "Simple game where you should break a code."
  spec.homepage = "https://github.com/VladyslavTodorchuk/Codebreakera_Gem"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/VladyslavTodorchuk/Codebreakera_Gem"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'rubocop-performance', '~> 1.14', '>= 1.14.3'
  spec.add_development_dependency 'rubocop', '~> 1.32'

  spec.add_development_dependency 'rubocop-rspec', '~> 2.12', '>= 2.12.1'

  spec.add_development_dependency 'fasterer', '~> 0.10.0'
  spec.add_development_dependency 'rspec', '~> 3.11'
end
