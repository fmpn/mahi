class Provider < ActiveRecord::Base

  has_many :services, dependent: :destroy
  belongs_to :user
  
  
  EMAIL_REGEXP = /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/
    validates_presence_of :name, :cpf
    validates_length_of :cpf, is: 14, allow_blank: false
    validates_uniqueness_of :cpf
    #validates :email, format: { with: /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/ }, :allow_blank => true
    
    def self.search(search)
        if search
          where('name LIKE ?', "%#{search}%")
        else
          scoped
        end
      end
end
