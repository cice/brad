module BradModels
  module Base

    def self.extended model_class
      model_class.instance_eval do
        extend ClassMethods
      end
    end

    module ClassMethods
      def to_a
        BradModels::Collection.new super, self
      end
    end
  end
end
