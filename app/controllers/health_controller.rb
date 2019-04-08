class HealthController < ApplicationController
  def show
    @presenter = Health::ShowPresenter.new
  end
end
