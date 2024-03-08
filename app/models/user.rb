class User < ApplicationRecord
    has_secure_password
    enum user_type: { guest: 0, login: 1 }
end
