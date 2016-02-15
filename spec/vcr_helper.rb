require 'rails_helper'
require 'vcr'

VCR.configure do |c|
  c.before_record do |i|
    i.response.body.force_encoding('UTF-8')
  end
end

VCR.configure do |config|
  config.cassette_library_dir = 'spec/vcr_cassetes'
  config.hook_into :webmock
  config.configure_rspec_metadata!
  [].each do |env_var|
    config.filter_senstive_data("<#{env_var}>") { ENV[env_var] }
  end
end
