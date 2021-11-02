require_relative '../../search_test'
require_relative '../../generator/group_metadata'

module USCore
  class MedicationRequestPatientIntentEncounterSearchTest < Inferno::Test
    include USCore::SearchTest

    title 'Server returns valid results for MedicationRequest search by patient + intent + encounter'
    description %(
      A server SHOULD support searching by patient + intent + encounter on the MedicationRequest resource. This
      test will pass if resources are returned and match the search criteria. If
      none are returned, the test is skipped'
    %)

    id :medication_request_patient_intent_encounter_search_test

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
      ['patient', 'intent', 'encounter']
    end

    run do
      perform_search_test
    end
  end
end
