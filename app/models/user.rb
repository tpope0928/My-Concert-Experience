class User < ApplicationRecord
    has_many :experiences
    has_many :exp_concerts

    has_many :exp_concerts, through: :experiences, source: :concert
end