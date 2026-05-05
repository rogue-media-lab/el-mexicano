class ContactController < ApplicationController
  def index
    @hours = Hour.ordered
    @address = SiteSetting.get("address")
    @phone = SiteSetting.get("phone")
    @email = SiteSetting.get("email")
  end
end
