class Category < ApplicationRecord
  # Direct associations

  has_many   :states,
             :dependent => :destroy

  has_many   :purchases

  # Indirect associations

  # Validations

end
