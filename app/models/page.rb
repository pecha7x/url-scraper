class Page < ApplicationRecord
  has_many :tags

  after_create :scrape_url

  private

  def scrape_url
    ParsePage.new(self).parse!
  end
end
