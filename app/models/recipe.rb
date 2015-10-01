class Recipe < ActiveRecord::Base
	belongs_to :user

	has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: lambda { |avatar| avatar.instance.set_default_url}
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

    def set_default_url
  ActionController::Base.helpers.asset_path('default-recipe.png')
end
end
