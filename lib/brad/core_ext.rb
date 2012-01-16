class Hash
  def to_tag_options
    Brad::View::TagOptions.new.merge! self
  end
end
