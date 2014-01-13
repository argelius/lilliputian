class User < ActiveRecord::Base
    has_many :posts
    has_secure_password

    before_validation :downcase_email
    validates_presence_of :password, :on => :create
    validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
    validates_uniqueness_of :email

    private
    def downcase_email
        self.email = self.email.downcase if self.email.present?
    end
end
