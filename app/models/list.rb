class List < ApplicationRecord
  validates_presence_of :title, :date

  scope :unfinished, -> { where(complete: false) }
end
