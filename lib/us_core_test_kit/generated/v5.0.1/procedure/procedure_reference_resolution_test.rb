require_relative '../../../reference_resolution_test'
require_relative '../resource_list'

module USCoreTestKit
  module USCoreV501
    class ProcedureReferenceResolutionTest < Inferno::Test
      include USCoreTestKit::ReferenceResolutionTest
      include ResourceList

      title 'MustSupport references within Procedure resources can be read'
      description %(
        This test will attempt to read external references provided within elements
        marked as 'MustSupport', if any are available.  Elements which may provide
        external references include:

        * Procedure.subject
      )

      id :us_core_v501_procedure_reference_resolution_test

      def resource_type
        'Procedure'
      end

      def self.metadata
        @metadata ||= Generator::GroupMetadata.new(YAML.load_file(File.join(__dir__, 'metadata.yml')))
      end

      def scratch_resources
        scratch[:procedure_resources] ||= {}
      end

      run do
        perform_reference_resolution_test(scratch_resources[:all])
      end
    end
  end
end