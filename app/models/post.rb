class MyValidator < ActiveModel::Validator
    def validate(record)
        if record.title
            unless record.title.include? 'Won\'t Believe' 
                record.errors[:title] << 'Need a name starting with click-baitey title!'
            end
        end
    end
end

class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}
    include ActiveModel::Validations
    validates_with MyValidator
end
