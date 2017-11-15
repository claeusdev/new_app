class Product < ApplicationRecord
	extend FriendlyId
  friendly_id :name, use: :slugged

	before_save :anti_spam

	is_impressionable
	mount_uploader :image, ImageUploader

	belongs_to :store
	
	has_many :assets, dependent: :destroy
	has_many :likes, dependent: :destroy
	belongs_to :order, optional: true
	
	accepts_nested_attributes_for :assets, :allow_destroy => true

	searchkick text_start: [:name]

	def search_data
		{
			name: name,
			description: description
		}
	end


	def anti_spam
    doc = Nokogiri::HTML::DocumentFragment.parse(description)

    doc.css('a').each do |a|
      a[:rel] = 'nofollow'
      a[:target] = '_blank'
    end

    self.description = doc.to_s
  end
end
