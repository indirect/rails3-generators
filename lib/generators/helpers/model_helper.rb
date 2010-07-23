module Rails3Generators
  module Helpers
    module Model 

      attr_accessor :model_attributes, :model_indexes

      def parse_model_attributes(with_indexes = true)
        @model_attributes = []        
        @model_indexes = {}
        # 
        # attributes.each do |arg|
        #   if with_indexes
        #     # extract index markers
        #     if arg.include?('#')  
        #       arg.gsub! /#.*$/, ''            
        #       model_indexes[arg_name(arg).to_sym] = true
        #     end
        #   end
        # 
        #   if arg.include?(':')
        #     model_attributes << Rails::Generators::GeneratedAttribute.new(*arg.split(':'))
        #   else
        #     model_attributes << Rails::Generators::GeneratedAttribute.new(arg, "string")            
        #   end
        # 
        #   model_attributes.uniq!
        # 
        #   if model_attributes.empty?
        #     if model_exists?
        #       model_columns_for_attributes.each do |column|
        #         model_attributes << Rails::Generators::GeneratedAttribute.new(column.name.to_s, column.type.to_s)
        #       end
        #     else
        #       model_attributes << Rails::Generators::GeneratedAttribute.new('name', 'string')
        #     end
        #   end
        # end 
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
            
    