config.gem "haml"

require 'rubygems'
require 'sass'

Sass::Plugin.options[:style] = :expanded

ENV['RAILS_ENV'] ||= 'production'
