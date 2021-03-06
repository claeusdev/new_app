class Product < ApplicationRecord
  before_destroy :ensure_not_referenced_by_any_line_item

	extend FriendlyId
  friendly_id :name, use: :slugged

	before_save :anti_spam

	is_impressionable
	mount_uploader :image, ImageUploader

	belongs_to :store
	
	has_many :assets, dependent: :destroy
	has_many :likes, dependent: :destroy
	has_many :line_items
	has_many :orders, through: :line_items
	
	
	accepts_nested_attributes_for :assets, :allow_destroy => true

	# Searching
	searchkick text_start: [:name]

	def search_data
		{
			name: name,
			description: description
		}
	end
	# End Search

	def anti_spam
    doc = Nokogiri::HTML::DocumentFragment.parse(description)

    doc.css('a').each do |a|
      a[:rel] = 'nofollow'
      a[:target] = '_blank'
    end

    self.description = doc.to_s
  end

	private
	# ensure that there are no line items referencing this product
	def ensure_not_referenced_by_any_line_item
		unless line_items.empty?
			errors.add(:base, 'Line Items present')
			throw :abort
		end
	end
end
