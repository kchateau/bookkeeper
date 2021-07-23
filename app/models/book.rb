class Book < ApplicationRecord
  has_and_belongs_to_many :authors
  has_and_belongs_to_many :genres
  has_many :genres
  has_many :reads
  has_many :authors

  after_create :create_user_read

  private

  def create_user_read
    user = User.find_by(id: self['user_id'])
    Read.create(user: user, book: Book.all.last, rating: 5)
  end
end
