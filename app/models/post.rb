class Post < ApplicationRecord

    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    validate :must_have_clickbait

    def must_have_clickbait
        if title
            unless title.include?("Won't Believe" || "Secret" || "Top [number]" || "Guess")
                errors.add(:title, "This is an invalid title")
            end
           
       end
    end

end
