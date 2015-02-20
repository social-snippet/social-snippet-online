require "json"
require "rack/parser"

::Editor::Application.controller :webapi do

  use ::Rack::Parser, :parsers => {
    "application/json" => proc {|data| ::JSON.parse data }
  }

  get :sources do
  end

  post :sources, :provides => :json do
    source = ::Editor::Models::Source.create!(:text => params["text"])
    source.as_json.to_json
  end

  put :sources, :with => [:id] do
    begin
      source = ::Editor::Models::Source.find(params[:id])
      source.update_attribute :text, params["text"] unless params["text"].nil?
      source.as_json.to_json
    rescue ::Mongoid::Errors::DocumentNotFound => e
      status 404
      "error"
    end
  end
  
  get :sources, :with => [:id] do
    begin
      source = ::Editor::Models::Source.find(params[:id])
      source.as_json.to_json
    rescue ::Mongoid::Errors::DocumentNotFound => e
      status 404
      "error"
    end
  end

end
