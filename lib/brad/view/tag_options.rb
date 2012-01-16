class Brad::View::TagOptions < Hash

  def merge other
    return super(other) unless self[:class] && other[:class]

    self_class = self[:class]
    other_class = other[:class]

    super(other).tap do |merged_hash|
      merged_hash[:class] = [self_class, other_class] * " "
    end
  end

  def merge! other
    return super(other) unless self[:class] && other[:class]

    self_class = self[:class]
    other_class = other[:class]

    super(other).tap do |merged_hash|
      merged_hash[:class] = [self_class, other_class] * " "
    end
  end

  def to_tag_options
    self
  end
end
