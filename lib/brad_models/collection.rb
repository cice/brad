module BradModels
  module Collection
    extend ActiveSupport::Concern

    attr_accessor :model

    def model_name
      model.model_name
    end

    class << self
      def new array, model
        array.extend self
        array.model = model
        array
      end
    end
  end
end
