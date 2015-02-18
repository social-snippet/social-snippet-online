::Editor::Application.controller do
  
  get :index do
    render :empty_view
  end

  get "-", :with => [:id]  do
    render :empty_view
  end

end
