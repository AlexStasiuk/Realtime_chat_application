class Message < ApplicationRecord
    belongs_to :user
    validates :message_text, presence: true, length: { maximum: 10000 }
end
