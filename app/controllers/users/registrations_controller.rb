# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  protected

  def build_resource(hash = {})
    hash[:uid] = User.create_unique_string
    super
  end

  def update_resource(resource, params)
    resource.update_without_current_password(params)
  end
end
