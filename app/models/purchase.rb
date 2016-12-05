class Purchase < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :purchase_date, :presence => true

  validates :purchase_name, :uniqueness => { :scope => [:purchase_date, :category_id] }

  validates :purchase_name, :presence => true

end
