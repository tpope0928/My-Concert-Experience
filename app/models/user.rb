class User < ApplicationRecord
    has_many :experiences
    has_many :concerts, through: :experiences
end
