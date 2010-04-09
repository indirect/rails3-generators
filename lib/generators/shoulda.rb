require 'rails/generators/named_base'

module Shoulda
  module Generators
    class Base < Rails::Generators::NamedBase #:nodoc:
      def self.source_root
        @_shoulda_source_root ||= File.expand_path(File.join(File.dirname(__FILE__), 'shoulda', generator_name, 'templates'))
      end
      
      
      # nicked from nifty_scaffold
      
      def action?(name)
         controller_actions.include? name.to_s
       end
      
      def items_path(suffix = 'path')
        if action? :index
          "#{plural_name}_#{suffix}"
        else
          "root_#{suffix}"
        end
      end

      def item_path(suffix = 'path')
        if action? :show
          "@#{singular_name}"
        else
          items_path(suffix)
        end
      end

      def item_path_for_test(suffix = 'path')
        if action? :show
          "#{singular_name}_#{suffix}(assigns(:#{singular_name}))"
        else
          items_path(suffix)
        end
      end
    end
  end
end