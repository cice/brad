class Brad::Resources::Model::Field
  extend ActiveSupport::Memoizable
  
  attr_reader :meta
  
  def initialize meta, field_meta
    @meta       = meta
    @field_meta = field_meta
  end
  
  def name
    @field_meta[:name].to_s
  end
  memoize :name
  
  def type
    @field_meta[:options][:type]    
  end
  memoize :type
  
  def default
    @field_meta[:options][:default]
  end
  memoize :default
  
  def private?
    name_suggests_private?
  end
  memoize :private?
  
  protected
  def name_suggests_private?
    !!(name =~ /^_/)
  end
end