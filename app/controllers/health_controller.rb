# TODO: Remove after migration to Rails 7
class HealthController < ActionController::Base

  rescue_from(Exception) { render_down }

  def show
    deprecation_message_rails_7('Need to remove HealthController for Rails v7 and above')
    render_up
  end

  private

    def render_up
      render html: html_status(color: "green")
    end

    def render_down
      render html: html_status(color: "red"), status: :service_unavailable
    end

    def html_status(color:)
      %(<html><body style="background-color: #{color}"></body></html>).html_safe
    end

    def deprecation_message_rails_7(msg)
      return Rails.version <= "7"

      Rails.logger.warn '!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!'
      Rails.logger.warn msg
      Rails.logger.warn '!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!'
    end
end
# END
