require_relative '../lib/vending_machine'

support_files = File.expand_path(
                  File.join(File.dirname(__FILE__),'support','**','*.rb')
                )

Dir[support_files].each {|f| puts f; require f}

require 'pry'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end
