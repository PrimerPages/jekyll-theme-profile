# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = 'jekyll-theme-profile'
  spec.version       = '0.0.0'
  spec.authors       = ['Allison Thackston']
  spec.email         = ['allison@allisonthackston.com']

  spec.summary       = "DEPRECATED: use jekyll-theme-primerpages instead."
  spec.description   = "This gem has been renamed to 'jekyll-theme-primerpages'. Please update your Gemfile."
  spec.homepage      = 'https://www.primerpages.com'
  spec.license       = 'MIT'
  # TODO: Remove theme files and dependencies after primerpages is released
  spec.files = Dir.glob([
                          'assets/**/*',
                          '_data/**/*',
                          '_layouts/**/*',
                          '_includes/**/*',
                          '_sass/**/*',
                          '_config.yml',
                          'LICENSE',
                          'README.md'
                        ])

  spec.required_ruby_version = '>=2.7.0'
  spec.add_dependency 'jekyll', '> 3.5', '< 5.0'
  spec.add_runtime_dependency 'jekyll-seo-tag', '~> 2.8'
  spec.add_runtime_dependency 'jemoji', '~> 0.13'
  spec.add_runtime_dependency 'kramdown-parser-gfm', '~> 1.1.0'
  # TODO: add this after primerpages is released
  # spec.add_runtime_dependency 'jekyll-theme-primerpages', '>= 0.0.0'

  spec.post_install_message = <<~MSG
    [DEPRECATED] 'jekyll-theme-profile' has been renamed to 'jekyll-theme-primerpages'.

    Please update your Gemfile:

      gem 'jekyll-theme-primerpages'

    And your _config.yml:

      theme: jekyll-theme-primerpages
  MSG
end
