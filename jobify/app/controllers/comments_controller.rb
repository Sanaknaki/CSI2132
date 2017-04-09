# Comment controller
class CommentsController < ApplicationController
  before_filter :authorize
  def index
    render('index')
    @comments = Comment.all
  end

  def fetch_comment
    @comment = Comment.find(params[:id])
    render('comment_details')
  end

  def add_company_comment
    @company = Company.find(params[:id])
    @comment = Comment.new(
      :ctext => params[:comment][:ctext],
      :company_id => params[:id]
    )
    @comment.save
    redirect_to @company
  end

  def add_job_comment
    @job = Job.find(params[:id])
    @job = @job.job_comment.create(
      :comment => params[:comment][:comment]
    )
    redirect_to "/companies/#{params[:c_id]}/jobs/#{params[:id]}"
  end

  def add_resume_comment
    @resume = Resume.find(params[:rid])
    puts @resume
    @comment = ResumeComment.new(
      :ctext => params[:comment][:ctext],
      :resume_id => params[:rid]
    )
    @comment.save
    redirect_to :back
    # redirect_to @resume
  end

  private

  def comment_params
    params.require(:comment).permit(:ctext)
  end

end
