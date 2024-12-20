class Worksheet < ApplicationRecord
  belongs_to :classroom
  has_many :questions, dependent: :destroy
  has_many :submissions, dependent: :destroy
end
