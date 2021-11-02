require_relative '../../search_test'
require_relative '../../generator/group_metadata'

module USCore
  class ImmunizationPatientStatusSearchTest < Inferno::Test
    include USCore::SearchTest

    title 'Server returns valid results for Immunization search by patient + status'
    description %(
      A server SHOULD support searching by patient + status on the Immunization resource. This
      test will pass if resources are returned and match the search criteria. If
      none are returned, the test is skipped'
    %)

    id :immunization_patient_status_search_test

    input :patient_id, default: '85'

    def resource_type
      'Immunization'
    end

    def self.metadata
      @metadata ||= Generator::GroupMetadata.new(YAML.load_file(File.join(__dir__, 'metadata.yml')))
    end

    def scratch_resources
      scratch[:immunization_resources] ||= []
    end

    def search_param_names
      ['patient', 'status']
    end

    run do
      perform_search_test
    end
  end
end
