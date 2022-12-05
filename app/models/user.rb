class User < ApplicationRecord
    has_many :guesses, dependent: :destroy
    has_many :individual_stats, dependent: :destroy

    def complete_todays_song(yesterday)
        song = Song.find_by(date: yesterday)
        if !(song)||!(self.individual_stats.find_by(song_id: song.id)&.completed == 1) 
            self.update(streak: 1)
            return self.streak
        elsif self.individual_stats.find_by(song_id: song.id)&.completed == 1
            self.update(streak: self.streak + 1)
            return self.streak
        end
    end
end
