class Post < ActiveRecord::Base

  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :check_if_clickbait, if: :title

  def check_if_clickbait
    words = ["Won't Believe", "Secret", "Top", "Guess"]

    words.each do |word|
      if title.include?(word)
        return true
      end
    end
    errors[:title] << 'Not clickbait-y enough'
    return false
  end
end
