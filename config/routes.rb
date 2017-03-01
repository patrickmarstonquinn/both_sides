Rails.application.routes.draw do
  # Routes for the Favorite_issue resource:
  # CREATE
  get "/favorite_issues/new", :controller => "favorite_issues", :action => "new"
  post "/create_favorite_issue", :controller => "favorite_issues", :action => "create"

  # READ
  get "/favorite_issues", :controller => "favorite_issues", :action => "index"
  get "/favorite_issues/:id", :controller => "favorite_issues", :action => "show"

  # UPDATE
  get "/favorite_issues/:id/edit", :controller => "favorite_issues", :action => "edit"
  post "/update_favorite_issue/:id", :controller => "favorite_issues", :action => "update"

  # DELETE
  get "/delete_favorite_issue/:id", :controller => "favorite_issues", :action => "destroy"
  #------------------------------

  # Routes for the Issue resource:
  # CREATE
  get "/issues/new", :controller => "issues", :action => "new"
  post "/create_issue", :controller => "issues", :action => "create"

  # READ
  get "/issues", :controller => "issues", :action => "index"
  get "/issues/:id", :controller => "issues", :action => "show"

  # UPDATE
  get "/issues/:id/edit", :controller => "issues", :action => "edit"
  post "/update_issue/:id", :controller => "issues", :action => "update"

  # DELETE
  get "/delete_issue/:id", :controller => "issues", :action => "destroy"
  #------------------------------

  devise_for :users
  # Routes for the User resource:
  # READ
  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
