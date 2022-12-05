class Song < ApplicationRecord
    has_many :guesses
    has_many :individual_stats
end
