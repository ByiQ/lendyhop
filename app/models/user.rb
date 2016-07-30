class User < ActiveRecord::Base
    def to_param
        user_name
    end
    # attr_accessible :firstname, :lastname, :user_name, :address, :phone, :created_time, :updated_time
end