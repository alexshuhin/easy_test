require 'factory_girl'
require 'ffaker'

Dir[Rails.root.join('spec/factories/*.rb')].each do |path|
  require path
end
