class IndividualStat < ApplicationRecord
    belongs_to :user
    belongs_to :song

    def self.median_plays(song)
        data = self.where(completed: true, song_id: song.id).group(:number_of_plays)

        plays_data = []
        data.each do |stat| 
            plays_data << stat.number_of_plays
        end

        sorted = plays_data.sort
        midpoint = plays_data.length / 2

        if plays_data.length.even?
            return sorted[midpoint-1, 2].sum / 2.0
        else
            return sorted[midpoint]
        end
    end
end
