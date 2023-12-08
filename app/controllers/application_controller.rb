# frozen_string_literal: true

# Contains common methods for all controllers
class ApplicationController < ActionController::Base
  # Include Pagy for pagination
  include Pagy::Backend
end
