class Blog < ApplicationRecord
    validates :title, presence: true
    validates :content, presence: true

    has_rich_text :body
    has_many :comments, dependent: :destroy
end
