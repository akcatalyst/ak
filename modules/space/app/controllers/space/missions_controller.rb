module Space
  class MissionsController < ApplicationController
    def index
      @missions = Mission.active.order(launch_date: :desc)
    end

    def show
      @mission = Mission.find(params[:id])
      @crew_members = @mission.crew_members
      @equipment = @mission.equipment
    end
  end
end 