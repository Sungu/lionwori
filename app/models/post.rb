class Post < ActiveRecord::Base
    acts_as_taggable
  belongs_to :user
  has_many :applicants, dependent: :destroy
  has_many :comments, dependent: :destroy
end
