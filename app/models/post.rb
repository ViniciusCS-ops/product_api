class Post < ApplicationRecord
    # belongs_to :user

    validates :titulo, presence: true
    validates :conteudo, presence: true
end
