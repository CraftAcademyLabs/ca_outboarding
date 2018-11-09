class Resource < ApplicationRecord
  enum type: { repo: 0, website: 1 }

  belongs_to :user
  validates_presence_of :url, :type

  private 

  def self.inheritance_column
    nil
  end
end
