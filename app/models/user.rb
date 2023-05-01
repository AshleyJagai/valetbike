class User < ApplicationRecord
    has_secure_password
    has_many :rentals
    has_many :bikes, through: :rentals 

    validates_presence_of :username
    validates_length_of :username, minimum: 1 

    validates_presence_of :password
    validates_length_of :username, minimum: 1 

    validates_presence_of :email
    validates_uniqueness_of :email 

    validates_presence_of :phone_number

    validates_presence_of :credit
    validates_numericality_of :credit, greater_than_or_equal_to: 0
    validates_presence_of :date_birth

    validate :user_age 

    #creds to this stack overflow post https://stackoverflow.com/questions/40457247/id-like-to-validate-a-birthdate-attribute-to-be-over-18-years-old 

    def user_age 
       if date_birth.present? && date_birth > 18.years.ago 
            errors.add( :date_birth, 'you must be at least 18 years old to use valetscoot')
    end 
    end

    #validate :age


    validates_presence_of :date_birth
    validate :user_age 

    #creds to this stack overflow post https://stackoverflow.com/questions/40457247/id-like-to-validate-a-birthdate-attribute-to-be-over-18-years-old 

    def user_age 
       if date_birth.present? && date_birth > 18.years.ago 
            errors.add( :date_birth, 'you must be at least 18 years old to use valetscoot')
    end 
end


#    validates "user age"

#     private 

#         def user_age 
#             if age. 
#                 errors.add(:attribute, "you must be at least 18 to use valetscoot")
#             end 
#         end 
    
    

    #validates: username, presence: true, uniqueness: true 
    #validates: email, presence: true, uniqueness: true
    #validates: phone_number, presence: true
    #validates: 
    #validates_numericality_of

    def welcome
        "Hello, #{self.email}!"
    end
end
