module Rails3Generators
  module Helpers
    module Model 

      attr_accessor :model_attributes, :model_indexes

      def parse_model_attributes(with_indexes = true)
        @model_attributes = []
        @model_indexes = {}
      end

      def arg_name(arg)
        arg.split(':').first        
      end

      def arg_type(arg)
        arg.split(':')[1] || 'string'
      end

      def model_name
        name
      end

      def model_exists?
        File.exist? destination_path("app/models/#{singular_name}.rb")
      end

      def singular_name
        model_name.underscore
      end

      def plural_name
        model_name.underscore.pluralize
      end

      def class_name
        model_name.camelize
      end

      def plural_class_name
        plural_name.camelize
      end
    end
  end
end
            