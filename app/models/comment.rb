class Comment < ApplicationRecord
  # Direct associations

  belongs_to :issue

  belongs_to :user

  # Indirect associations

  # Validations

end
