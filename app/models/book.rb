class Book < ApplicationRecord
  attr_accessor :rating

  has_and_belongs_to_many :authors
  has_and_belongs_to_many :genres
  has_many :genres
  has_many :reads
  has_many :authors
end
