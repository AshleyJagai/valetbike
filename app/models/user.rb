class User < ApplicationRecord
    has_secure_password
    has_many :rentals
    has_many :bikes, through: :rentals 

    validates_presence_of :username
    validates_length_of :username, minimum: 1 

    validates_presence_of :password
    validates_length_of :username, minimum: 1 

    validates_presence_of :email

    validates_presence_of :phone_number

    validates_presence_of :credit
    validates_numericality_of :credit, greater_than_or_equal_to: 0

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
