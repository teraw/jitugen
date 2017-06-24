class Board < ActiveRecord::Base
       has_many :comments, dependent: :destroy
       #VALID_EMAIL_REGEX =  /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i #
	   validates :title, presence: true, length: { in: 1..12 },exclusion: { in: %w(select insert truncate -) }
	   validates :editor, presence: true, length: { in: 1..8 }

	   
end
