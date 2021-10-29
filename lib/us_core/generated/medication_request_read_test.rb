require_relative '../read_test'

module USCore
  class MedicationRequestReadTest < Inferno::Test
    include USCore::ReadTest

    title 'Server returns correct MedicationRequest resource from MedicationRequest read interaction'
    description 'A server SHALL support the MedicationRequest read interaction.'

    id :medication_request_read_test

    def resource_type
      'MedicationRequest'
    end

    run do
      perform_read_test(scratch[:medication_request_resources])
    end
  end
end
