require 'uri'

class Link < ActiveRecord::Base
  belongs_to :user
	include ActiveModel::Validations

	validates :url, :presence => true

	validates_each :url do |record, attribute, value|
    return if value.blank?
    begin
      uri = URI.parse(value)
      resp = uri.kind_of?(URI::HTTP)
    rescue URI::InvalidURIError
      resp = false
    end
    unless resp == true
      record.errors[attribute] << "is not a valid url"
    end
  end
end
