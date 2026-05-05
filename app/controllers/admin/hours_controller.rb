module Admin
  class HoursController < BaseController
    def edit
      @hours = Hour.ordered
    end

    def update
      hours_params = params.require(:hours)
      Hour.transaction do
        hours_params.each do |id, attrs|
          hour = Hour.find(id)
          hour.update!(attrs.permit(:open_time, :close_time, :closed))
        end
      end
      redirect_to edit_admin_hours_path, notice: "Hours updated."
    rescue => e
      redirect_to edit_admin_hours_path, alert: "Error: #{e.message}"
    end
  end
end
