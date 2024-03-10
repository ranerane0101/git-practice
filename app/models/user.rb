class User < ApplicationRecord
    has_secure_password
    # キーバリュー形式；キーがguest、バリューが0
    # これはmainにマージされるコメントです
    # ああああああああ
    enum user_type: { guest: 0, login: 1 }
end
