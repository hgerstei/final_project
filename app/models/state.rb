class State < ApplicationRecord
  # Direct associations

  has_one    :recommendation,
             :dependent => :destroy

  has_many   :recipes,
             :dependent => :destroy

  belongs_to :category

  # Indirect associations

  # Validations

end
