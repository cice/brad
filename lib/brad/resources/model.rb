module Brad::Resources::Model
  extend ActiveSupport::Concern
  
  included do
    include Mongoid::Document
  end
end