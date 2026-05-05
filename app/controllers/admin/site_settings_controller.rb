module Admin
  class SiteSettingsController < BaseController
    def edit
      @settings = SiteSetting.all.index_by(&:key)
    end

    def update
      settings_params = params.require(:settings)
      settings_params.each do |key, value|
        SiteSetting.set(key, value)
      end
      redirect_to edit_admin_site_settings_path, notice: "Settings updated."
    end
  end
end
