module Paracomic
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    
    layout 'paracomic/application'
  end
end 