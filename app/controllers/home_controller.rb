class HomeController < ApplicationController
  def index
    render inertia: 'Home', props: {
      name: 'Home'
    }
  end
end
