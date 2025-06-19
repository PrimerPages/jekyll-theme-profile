
#!/usr/bin/bash

# Install additional dependencies
sudo apt-get update
sudo apt-get install -y \
    bats

# Set bundle path to local directory (inside project)
bundle config set --local path 'vendor/bundle'

# Install the version of Bundler.
if [ -f Gemfile.lock ] && grep "BUNDLED WITH" Gemfile.lock > /dev/null; then
    echo "Installing bundler in gemfile"
    cat Gemfile.lock | tail -n 2 | grep -C2 "BUNDLED WITH" | tail -n 1 | xargs gem install bundler -v
fi

# If there's a Gemfile, then run `bundle install`
# It's assumed that the Gemfile will install Jekyll too
if [ -f Gemfile ]; then
    bundle install
fi

# Get the current ruby version and set .ruby-version
ruby_version=$(ruby -v | awk '{print $2}')
printf %s "$ruby_version" > .ruby-version
echo "Ruby version $ruby_version set in .ruby-version file"
