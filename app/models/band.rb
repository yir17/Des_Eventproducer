class Band < ApplicationRecord
  has_many :concerts
  enum kind: %i[band solist]
end