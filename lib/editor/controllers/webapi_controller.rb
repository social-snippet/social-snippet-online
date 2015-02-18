require "json"
require "rack/parser"

::Editor::Application.controller :webapi do

  use ::Rack::Parser, :parsers => {
    "application/json" => proc {|data| ::JSON.parse data }
  }

  get :sources do
  end

  post :sources, :provides => :json do
    source = ::Editor::Source.create(:text => params["text"])
    source.as_json.to_json
  end

  put :sources, :with => [:id] do
  end
  
  get :sources, :with => [:id] do
  end

end
