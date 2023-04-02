class Project < ApplicationRecord
  audited only: :status

  has_many :comments, as: :commentable
end
