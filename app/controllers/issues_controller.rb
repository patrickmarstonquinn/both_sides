class IssuesController < ApplicationController
  before_action :current_user_must_be_issue_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_issue_user
    issue = Issue.find(params[:id])

    unless current_user == issue.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = Issue.ransack(params[:q])
    @issues = @q.result(:distinct => true).includes(:user, :favorite_issues, :comments).page(params[:page]).per(10)

    render("issues/index.html.erb")
  end

  def show
    @comment = Comment.new
    @favorite_issue = FavoriteIssue.new
    @issue = Issue.find(params[:id])

    render("issues/show.html.erb")
  end

  def new
    @issue = Issue.new

    render("issues/new.html.erb")
  end

  def create
    @issue = Issue.new

    @issue.conservative_take = params[:conservative_take]
    @issue.liberal_take = params[:liberal_take]
    @issue.topic = params[:topic]
    @issue.user_id = params[:user_id]
    @issue.issue_name = params[:issue_name]
    @issue.image = params[:image]

    save_status = @issue.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/issues/new", "/create_issue"
        redirect_to("/issues")
      else
        redirect_back(:fallback_location => "/", :notice => "Issue created successfully.")
      end
    else
      render("issues/new.html.erb")
    end
  end

  def edit
    @issue = Issue.find(params[:id])

    render("issues/edit.html.erb")
  end

  def update
    @issue = Issue.find(params[:id])

    @issue.conservative_take = params[:conservative_take]
    @issue.liberal_take = params[:liberal_take]
    @issue.topic = params[:topic]
    @issue.user_id = params[:user_id]
    @issue.issue_name = params[:issue_name]
    @issue.image = params[:image]

    save_status = @issue.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/issues/#{@issue.id}/edit", "/update_issue"
        redirect_to("/issues/#{@issue.id}", :notice => "Issue updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Issue updated successfully.")
      end
    else
      render("issues/edit.html.erb")
    end
  end

  def destroy
    @issue = Issue.find(params[:id])

    @issue.destroy

    if URI(request.referer).path == "/issues/#{@issue.id}"
      redirect_to("/", :notice => "Issue deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Issue deleted.")
    end
  end
end
