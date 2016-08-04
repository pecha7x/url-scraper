class Tag < ApplicationRecord
  belongs_to :page
  enum kind: [:h1, :h2, :h3, :a]
end
