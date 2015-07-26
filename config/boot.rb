ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

if ENV['NO_REQUIRE_CACHE']
  puts 'RequireCache disabled'
else
  puts 'RequireCache enabled'
  $LOAD_PATH.reject! { |path| path.include?('/bundler-') }
  $LOAD_PATH.unshift(File.expand_path('../../vendor/bundler/lib', __FILE__))

  require 'bundler'
  Bundler::CachedRuntime.blacklist += %w(snappy oj stackprof)
  Bundler.runtime_implementation = Bundler::CachedRuntime
end

require 'bundler/setup' # Set up gems listed in the Gemfile.
