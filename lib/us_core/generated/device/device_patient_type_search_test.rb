require_relative '../../search_test'
require_relative '../../generator/group_metadata'

module USCore
  class DevicePatientTypeSearchTest < Inferno::Test
    include USCore::SearchTest

    title 'Server returns valid results for Device search by patient + type'
    description %(
A server SHOULD support searching by
patient + type on the Device resource. This test
will pass if resources are returned and match the search criteria. If
none are returned, the test is skipped.

[US Core Server CapabilityStatement](http://hl7.org/fhir/us/core/STU3.1.1/CapabilityStatement-us-core-server.html)

    )

    id :us_core_311_device_patient_type_search_test

    input :patient_ids,
      title: 'Patient IDs',
      description: 'Comma separated list of patient IDs that in sum contain all MUST SUPPORT elements',
      default: '85,355'

    input :implantable_device_codes,
      title: 'Implantable Device Type Code',
      description: 'Enter the code for an Implantable Device type, or multiple codes separated by commas. '\
                   'If blank, Inferno will validate all Device resources against the Implantable Device profile',
      optional: true

    def self.properties
      @properties ||= SearchTestProperties.new(
        resource_type: 'Device',
        search_param_names: ['patient', 'type'],
        token_search_params: ['type']
      )
    end

    def self.metadata
      @metadata ||= Generator::GroupMetadata.new(YAML.load_file(File.join(__dir__, 'metadata.yml')))
    end

    def scratch_resources
      scratch[:device_resources] ||= {}
    end

    run do
      run_search_test
    end
  end
end
