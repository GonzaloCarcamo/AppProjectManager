class Project < ApplicationRecord
  validates :name, presence: {message: ""}
  validates :description, presence: {message: ""}
  validates :state, presence: {message: ""}
end
