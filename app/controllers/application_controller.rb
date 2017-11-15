class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

   def after_sign_in_path_for(resource)
      if resource.store.present?
      	store_dashboard_path(resource.store)
      end
   end


   BRAND_NAME = 'Claeus'.freeze

  def meta_title(title)
    [title, BRAND_NAME].reject(&:empty?).join(' | ')
  end
end
