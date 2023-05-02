class User < ApplicationRecord
    has_secure_password
    has_many :rentals
    has_many :bikes, through: :rentals 

    validates_presence_of :username
    validates_length_of :username, minimum: 8
    validates_uniqueness_of :username 

    validates_presence_of :password
    validates_length_of :username, minimum: 8 

    validates_presence_of :email
    validates_uniqueness_of :email


    validates_presence_of :phone_number
    validates_length_of :phone_number, is: 10

    validates_presence_of :credit
    validates_numericality_of :credit, greater_than_or_equal_to: 0
    validates_presence_of :date_birth

    validate :user_age 

    #creds to this stack overflow post https://stackoverflow.com/questions/40457247/id-like-to-validate-a-birthdate-attribute-to-be-over-18-years-old 

    def user_age 
       if date_birth.present? && date_birth > 18.years.ago 
        
            errors.add( :date_birth, 'You must be at least 18 years or older to use ValetScoot')
     end 
     
    end

   



    #validate :age


    #validates_

    # username 
    #password 
    #email 
    #addy  
    # phone number  #only numbers 
    #credits # not being a number, less then zero, more then 2 decimal places 

    
    

    #validates: username, presence: true, uniqueness: true 
    #validates: email, presence: true, uniqueness: true
    #validates: phone_number, presence: true
    #validates: 
    #validates_numericality_of

    def welcome
        "Hello, #{self.email}!"
    end
end
