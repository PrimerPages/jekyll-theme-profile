# frozen_string_literal: true

require "rake/clean"

gemspec_path = File.expand_path("jekyll-theme-profile.gemspec", __dir__)
spec = Gem::Specification.load(gemspec_path)
gem_name = "#{spec.name}-#{spec.version}.gem"
pkg_path = File.join("pkg", gem_name)

CLEAN.include(gem_name)
CLOBBER.include("pkg")

desc "Build #{gem_name}"
task :build do
  rm_f gem_name
  mkdir_p "pkg"
  sh "gem", "build", "jekyll-theme-profile.gemspec"
  mv gem_name, pkg_path
end

desc "Build and publish #{gem_name}"
task release: :build do
  sh "gem", "push", pkg_path
end

task default: :build
