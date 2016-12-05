class Recipe < ApplicationRecord
  # Direct associations

  belongs_to :state,
             :counter_cache => true

  # Indirect associations

  has_one    :category,
             :through => :state,
             :source => :category

  # Validations

end
