class Post < ActiveRecord::Base
    def to_param
        "#{slug}-#{id}"
    end

    belongs_to :user
    has_many :post_tags, :dependent => :delete_all
    has_many :tags, :through => :post_tags

    validates_presence_of :user_id
    validates :title, presence: true, length: { minimum: 1 }
    validates :content, presence: true, length: { minimum: 5 }
    validates :slug, presence: true, uniqueness: true, length: { minimum: 1 }
end
