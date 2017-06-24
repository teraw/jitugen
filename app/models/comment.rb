class Comment < ActiveRecord::Base
     belongs_to :board
	 validates :board, presence: true
	 validates :name, presence: true,exclusion: { in: %w(select insert truncate -) }
	 validates :content, presence: true, length: { in: 1..1000 },exclusion: { in: %w(select insert truncate -) }
end
