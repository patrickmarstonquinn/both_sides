class Issue < ApplicationRecord
  # Direct associations

  has_many   :favorite_issues,
             :dependent => :destroy

  belongs_to :user,
             :counter_cache => true

  # Indirect associations

  # Validations

end
