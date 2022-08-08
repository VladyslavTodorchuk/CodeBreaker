# frozen_string_literal: true

require_relative '../lib/codebreaker'
require 'simplecov'

Dir['./spec/support/**/*.rb'].sort.each { |f| require f }
SimpleCov.start
