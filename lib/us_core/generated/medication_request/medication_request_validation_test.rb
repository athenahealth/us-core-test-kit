require_relative '../../validation_test'

module USCore
  class MedicationRequestValidationTest < Inferno::Test
    include USCore::ValidationTest

    title 'MedicationRequest resources returned during previous tests conform to the US Core MedicationRequest Profile'
    # description ''

    id :medication_request_validation_test

    def resource_type
      'MedicationRequest'
    end

    def scratch_resources
      scratch[:medication_request_resources] ||= {}
    end

    run do
      perform_validation_test(scratch_resources[:all] || [], 'http://hl7.org/fhir/us/core/StructureDefinition/us-core-medicationrequest')
    end
  end
end
