class Tag < ActiveRecord::Base
    def to_param
        tag
    end

    before_validation :downcase_and_underscores

    has_many :post_tags, :dependent => :delete_all
    has_many :posts, :through => :post_tags
    validates :tag, presence: true, uniqueness: true, length: { minimum: 1, maximum: 20 }

    private

    def downcase_and_underscores
        self.tag = self.tag.downcase.gsub(/\s+/, "_")
    end
end
