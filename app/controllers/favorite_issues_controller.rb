class FavoriteIssuesController < ApplicationController
  def index
    @favorite_issues = FavoriteIssue.all

    render("favorite_issues/index.html.erb")
  end

  def show
    @favorite_issue = FavoriteIssue.find(params[:id])

    render("favorite_issues/show.html.erb")
  end

  def new
    @favorite_issue = FavoriteIssue.new

    render("favorite_issues/new.html.erb")
  end

  def create
    @favorite_issue = FavoriteIssue.new

    @favorite_issue.issue_id = params[:issue_id]
    @favorite_issue.user_id = params[:user_id]

    save_status = @favorite_issue.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/favorite_issues/new", "/create_favorite_issue"
        redirect_to("/favorite_issues")
      else
        redirect_back(:fallback_location => "/", :notice => "Favorite issue created successfully.")
      end
    else
      render("favorite_issues/new.html.erb")
    end
  end

  def edit
    @favorite_issue = FavoriteIssue.find(params[:id])

    render("favorite_issues/edit.html.erb")
  end

  def update
    @favorite_issue = FavoriteIssue.find(params[:id])

    @favorite_issue.issue_id = params[:issue_id]
    @favorite_issue.user_id = params[:user_id]

    save_status = @favorite_issue.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/favorite_issues/#{@favorite_issue.id}/edit", "/update_favorite_issue"
        redirect_to("/favorite_issues/#{@favorite_issue.id}", :notice => "Favorite issue updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Favorite issue updated successfully.")
      end
    else
      render("favorite_issues/edit.html.erb")
    end
  end

  def destroy
    @favorite_issue = FavoriteIssue.find(params[:id])

    @favorite_issue.destroy

    if URI(request.referer).path == "/favorite_issues/#{@favorite_issue.id}"
      redirect_to("/", :notice => "Favorite issue deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Favorite issue deleted.")
    end
  end
end
