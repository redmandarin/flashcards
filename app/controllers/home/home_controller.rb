class Home::HomeController < Home::BaseController

  def index
    set_card

    respond_to do |format|
      format.html
      format.js
    end
  end
end
