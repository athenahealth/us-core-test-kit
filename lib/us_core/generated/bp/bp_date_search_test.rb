require_relative '../../search_test'
require_relative '../../generator/group_metadata'

module USCore
  class BpDateSearchTest < Inferno::Test
    include USCore::SearchTest

    title 'Server returns valid results for Observation search by date'
    description %(
      A server MAY support searching by date on the Observation resource. This
      test will pass if resources are returned and match the search criteria. If
      none are returned, the test is skipped'
    %)

    id :bp_date_search_test

    def resource_type
      'Observation'
    end

    def self.metadata
      @metadata ||= Generator::GroupMetadata.new(YAML.load_file(File.join(__dir__, 'metadata.yml')))
    end

    def scratch_resources
      scratch[:bp_resources] ||= []
    end

    def search_param_names
      ['date']
    end

    run do
      perform_search_test
    end
  end
end
