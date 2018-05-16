require 'carrierwave/orm/activerecord'
require 'carrierwave'

CarrierWave.config do |config|
  config.root = Rails.root
end
