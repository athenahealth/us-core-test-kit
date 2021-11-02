require_relative '../../search_test'
require_relative '../../generator/group_metadata'

module USCore
  class MedicationRequestPatientIntentSearchTest < Inferno::Test
    include USCore::SearchTest

    title 'Server returns valid results for MedicationRequest search by patient + intent'
    description %(
      A server SHALL support searching by patient + intent on the MedicationRequest resource. This
      test will pass if resources are returned and match the search criteria. If
      none are returned, the test is skipped'
    %)

    id :medication_request_patient_intent_search_test

    input :patient_id, default: '85'

    def resource_type
      'MedicationRequest'
    end

    def self.metadata
      @metadata ||= Generator::GroupMetadata.new(YAML.load_file(File.join(__dir__, 'metadata.yml')))
    end

    def scratch_resources
      scratch[:medication_request_resources] ||= []
    end

    def search_param_names
      ['patient', 'intent']
    end

    run do
      perform_fixed_value_search_test
    end
  end
end
