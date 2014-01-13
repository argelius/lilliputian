class Post < ActiveRecord::Base
    belongs_to :user

    validates_presence_of :user_id
    validates :title, presence: true, length: { minimum: 1 }
    validates :content, presence: true, length: { minimum: 5 }
end
