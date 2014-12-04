gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require 'bigdecimal'
require 'bigdecimal/util'

lib_dir = File.expand_path('../lib', __dir__)
$LOAD_PATH.unshift(lib_dir)

# lib_dir = File.expand_path('../data', __dir__)
# $LOAD_PATH.unshift(lib_dir)

# filepath = File.expand_path('../../data', __FILE__)
