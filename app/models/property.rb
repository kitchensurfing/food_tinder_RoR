class Property < ActiveRecord::Base
  BinaryType = "Binary"
  ScalarType = "Scalar"
  TYPES = [ BinaryType, ScalarType ]
end
