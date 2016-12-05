class Category < ApplicationRecord
  # Direct associations

  has_many   :purchases

  # Indirect associations

  # Validations

end
