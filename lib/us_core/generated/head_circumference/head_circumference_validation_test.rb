require_relative '../../validation_test'

module USCore
  class HeadCircumferenceValidationTest < Inferno::Test
    include USCore::ValidationTest

    title 'Observation resources returned during previous tests conform to the US Core Pediatric Head Occipital-frontal Circumference Percentile Profile'
    # description ''

    id :head_circumference_validation_test

    def resource_type
      'Observation'
    end

    def scratch_resources
      scratch[:head_circumference_resources] ||= {}
    end

    run do
      perform_validation_test(scratch_resources[:all] || [], 'http://hl7.org/fhir/us/core/StructureDefinition/head-occipital-frontal-circumference-percentile')
    end
  end
end
