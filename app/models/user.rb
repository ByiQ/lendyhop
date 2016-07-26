class User < ActiveRecord::Base
    attr_accessible :firstname, :lastname, :user_name, :address, :phone
end