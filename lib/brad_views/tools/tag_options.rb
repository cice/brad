class BradViews::Tools::TagOptions < Hash

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

  def reverse_merge other
    other.to_tag_options.merge! self
  end

  def to_tag_options
    dup
  end

  def extractable_options?
    true
  end
end

class ::Hash
  def to_tag_options
    BradViews::Tools::TagOptions.new.merge!(self)
  end
end

class ::Array
  def extract_tag_options!
    extract_options!.to_tag_options
  end
end
