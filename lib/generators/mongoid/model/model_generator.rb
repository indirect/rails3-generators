require 'generators/mongoid'

module Mongoid
  module Generators
    class ModelGenerator < Base
      argument :attributes, :type => :array, :default => [], :banner => "field:type field:type"  
      
      class_option :embedded_in,  :type => :string,   :aliases => "-E",  :desc => "Class name of document this document is embedded in"
      class_option :parent,       :type => :string,   :aliases => "-P",  :desc => "Class name of parent document"
      class_option :timestamps,   :type => :boolean,  :aliases => "-T",  :desc => "Add timestamps created_at and updated_at", :default => false
      class_option :version,      :type => :boolean,  :aliases => "-V",  :desc => "Add versioning", :default => false      
      class_option :enslave,      :type => :boolean,  :aliases => "-S",  :desc => "Add enslavement", :default => false      
      class_option :cache,        :type => :boolean,  :aliases => "-C",  :desc => "Add Caching", :default => false      

      class_option :index,        :type => :array,    :aliases => "-I",  :desc => "Keys to index", :default => []      
                                 
      def create_model_file        
        template('model.rb', "app/models/#{file_name}.rb") if valid_model_name?(file_name)
      end

      protected  

      def valid_model_name?(name)
        (name =~ /("|'|:|;|\||&|<|>)/).nil? 
      end

      def embedded?
        options[:embedded_in]
      end

      def enslave?
        options[:enslave]
      end

      def cache?
        options[:cache]
      end

      def parent?
        options[:parent]
      end

      def parent
        options[:parent]        
      end

      def timestamps?
        options[:timestamps]
      end

      def version?
        options[:version]
      end

      def indexes
        options[:index] || []                
      end
                 
      def indexes?
        !indexes.empty?
      end      

      def has_key?(key)
        attribute_names.include?(key)        
      end
      
      def attribute_names
        attributes.map { |key| key.name}
      end        
      
      def write_indexes
        say "write_indexes", :green
        if indexes?
          idx = indexes.map { |key| "  index :#{key}, :unique => true" if has_key?(key) } 
          say "indexes: #{idx}"
          idx.join("\n") 
        else
          say "no indexes"
          nil
        end
      end

      def extra_statements
        stm_list = []        
        stm_list << "  cache" if cache?
        stm_list << "  enslave" if enslave?
        stm_list.join("\n")        
      end        

      def statements
        stm_list = []
        stm_list << embedded_statement if embedded?
        stm_list << version_statement if version?
        stm_list << timestamps_statement if timestamps?
        stm_list.join("\n")        
      end

      def embedded_statement
        "embedded_in :#{options[:embedded_in].underscore}, :inverse_of => :#{class_name.pluralize.underscore}"
      end

      def version_statement
        "include Mongoid::Versioning"
      end

      def timestamps_statement
        "include Mongoid::Timestamps"
      end     
    end
  end
end