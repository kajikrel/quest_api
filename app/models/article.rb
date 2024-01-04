class Article < ApplicationRecord
  before_save :set_slug

  private

  def set_slug
    if title.present?
        romanized_title = Romaji.kana2romaji(title)
         self.slug = romanized_title.parameterize
    end
  end
end
