class Post < ActiveRecord::Base
  belongs_to :user
  has_many :applicants, dependent: :destroy
end
