require 'minitest/autorun'
require 'tax_cloud'
require 'json'

# If not included then no test reports are generated
# for Circle CI builds.
require 'minitest/ci'


Savon.configure do |config|
  config.log = false
end

HTTPI.log = false

require 'vcr_setup'
require 'test_setup'
