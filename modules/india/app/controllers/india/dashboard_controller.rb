module India
  class DashboardController < ApplicationController
    def index
      @projects = Project.active.order(created_at: :desc).limit(5)
      @team_members = TeamMember.active.order(created_at: :desc).limit(5)
      @recent_documents = Document.recent.order(created_at: :desc).limit(5)
    end
  end
end 