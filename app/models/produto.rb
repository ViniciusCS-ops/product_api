class Produto < ApplicationRecord
    #belongs_to :user

    validates :nome, presence: true
    validates :quantidade, presence: true
    validates :preco, presence: true
end
