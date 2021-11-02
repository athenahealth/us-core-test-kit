require_relative '../../search_test'
require_relative '../../generator/group_metadata'

module USCore
  class GoalPatientSearchTest < Inferno::Test
    include USCore::SearchTest

    title 'Server returns valid results for Goal search by patient'
    description %(
      A server SHALL support searching by patient on the Goal resource. This
      test will pass if resources are returned and match the search criteria. If
      none are returned, the test is skipped'
    %)

    id :goal_patient_search_test

    input :patient_id, default: '85'

    def resource_type
      'Goal'
    end

    def self.metadata
      @metadata ||= Generator::GroupMetadata.new(YAML.load_file(File.join(__dir__, 'metadata.yml')))
    end

    def scratch_resources
      scratch[:goal_resources] ||= []
    end

    def search_param_names
      ['patient']
    end

    run do
      perform_search_test
    end
  end
end
