class Property < ActiveRecord::Base
  attr_accessor :value

  BinaryType = "Binary"
  ScalarType = "Scalar"
  TYPES = [ BinaryType, ScalarType ]

  def get_value_hash
    if value_type == Property::ScalarType
      high, low = self.value.split('-')
      {high: high.to_f, low: low.to_f}
    elsif value_type == Property::BinaryType
      {acceptable: self.value}
    end
  end

  def get_value(input_hash)
    if value_type == Property::ScalarType
      [input_hash[:low], input_hash[:high]].join('-')
    elsif value_type == Property::BinaryType
      input_hash[:accepted]
    end
  end

  def get_value_hash_from_string(string_value)
    if value_type == Property::ScalarType
      low, high = string_value.split('-')
      {high: high.to_f, low: low.to_f}
    elsif value_type == Property::BinaryType
      {acceptable: string_value}
    end
  end
end
