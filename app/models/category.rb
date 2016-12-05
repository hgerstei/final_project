class Category < ApplicationRecord
  # Direct associations

  has_many   :states,
             :dependent => :destroy

  has_many   :purchases

  # Indirect associations

  has_many   :recommendations,
             :through => :states,
             :source => :recommendation

  # Validations

end
