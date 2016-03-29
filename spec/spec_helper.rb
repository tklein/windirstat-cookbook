require 'rspec/expectations'
require 'chefspec'
require 'chefspec/berkshelf'

RSpec.configure do |config|
  config.color = true
  config.log_level = :fatal # ignore warnings
  config.alias_example_group_to :describe_recipe, type: :recipe
  config.alias_example_group_to :describe_resource, type: :resource
  config.alias_example_group_to :describe_attribute, type: :attribute

  config.filter_run :focus
  config.run_all_when_everything_filtered = true

  Kernel.srand config.seed
  config.order = :random

  config.default_formatter = 'doc' if config.files_to_run.one?

  config.expect_with :rspec do |expectations|
    expectations.syntax = :expect
  end

  config.mock_with :rspec do |mocks|
    mocks.syntax = :expect
    mocks.verify_partial_doubles = true
  end

  config.platform = 'windows'
  config.version = '2012R2'
  ENV['ProgramFiles(x86)'] = 'C:\Program Files (x86)' # assume 64bit OS
  ENV['ProgramFiles'] = 'C:\Program Files'
  ENV['WINDIR'] = 'C:\Windows'
  ENV['SYSTEMDRIVE'] = 'C:\\'
end
