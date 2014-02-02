class PostTag < ActiveRecord::Base
    validates_uniqueness_of :post, :scope => :tag
    belongs_to :post
    belongs_to :tag
end
