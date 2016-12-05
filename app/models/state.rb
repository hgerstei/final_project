class State < ApplicationRecord
  # Direct associations

  has_many   :recipes,
             :dependent => :destroy

  belongs_to :category

  # Indirect associations

  # Validations

end
