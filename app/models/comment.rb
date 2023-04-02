class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :commentable, polymorphic: true

  validates_presence_of :body

  def decorate
    CommentDecorator.new(self)
  end
end
