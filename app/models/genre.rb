class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  def slug
    arr = self.name.split(' ')
    arr.map do |x|
      x.gsub!(/[^0-9A-Za-z]/, '')
    end
    slug = arr.join('-')
    slug.downcase
  end

  def self.find_by_slug(slug)
    arr = slug.split('-')
    slug = arr.join(' ')
    self.where(["lower(name) = ?", slug]).first
  end
end
