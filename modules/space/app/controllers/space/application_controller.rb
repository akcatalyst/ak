module Space
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    
    layout 'space/application'
  end
end 