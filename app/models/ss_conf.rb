class SsConf < ApplicationRecord
  belongs_to :user, class_name: 'Registration::User', optional: true

  validates :port, numericality: { only_integer: true,
                                   greater_than_or_equal_to: 1,
                                   less_than_or_equal_to: 65534 }
end
