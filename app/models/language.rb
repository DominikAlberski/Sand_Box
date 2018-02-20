class Language < ApplicationRecord
  validates :name, inclusion: { in: %w(ruby css js html),
    message: "%{name} is not a valid Language" }
end
