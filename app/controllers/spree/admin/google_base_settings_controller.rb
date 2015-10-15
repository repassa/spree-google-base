class Spree::Admin::GoogleBaseSettingsController < Spree::Admin::BaseController
  helper 'spree/admin/google_base'
  helper_method :collection_url

  def update
    params.each do |name, value|
      next unless Spree::GoogleBase::Config.has_preference? name
      Spree::GoogleBase::Config[name] = value
    end

    respond_to do |format|
      format.html { redirect_to admin_google_base_settings_path }
    end
  end

  def collection_url
    admin_google_base_settings_url
  end
end
