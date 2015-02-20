require "json"
require "rack/parser"

::Editor::Application.controller :webapi do

  use ::Rack::Parser, :parsers => {
    "application/json" => proc {|data| ::JSON.parse data }
  }

  post :sources, :provides => :json do
    source = ::Editor::Models::Source.create!(:text => params["text"], :language => params["language"])
    source.as_json.to_json
  end

  put :sources, :with => [:id], :provides => :json do
    begin
      source = ::Editor::Models::Source.find(params[:id])
      source.text = params["text"] unless params["text"].nil?
      source.language = params["language"] unless params["language"].nil?
      source.save!
      source.as_json.to_json
    rescue ::Mongoid::Errors::DocumentNotFound => e
      status 404
      "error"
    end
  end
  
  get :sources, :with => [:id], :provides => :json do
    begin
      source = ::Editor::Models::Source.find(params[:id])
      source.as_json.to_json
    rescue ::Mongoid::Errors::DocumentNotFound => e
      status 404
      "error"
    end
  end

  post :statuses, :provides => :json do
    begin
      status = ::Editor::Models::Status.submit(params[:source_id])
      status.as_json.to_json
    rescue ::Mongoid::Errors::DocumentNotFound => e
      status 404
      "error"
    end
  end

end
