class Resource < ApplicationRecord
  enum of_type: { repo: 0, website: 1 }

  belongs_to :user
  validates_presence_of :url, :of_type
end
