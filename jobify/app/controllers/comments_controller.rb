# Comment controller
class CommentsController < ApplicationController
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
    @job = Job.find(params[:job_id])
    @job = @job.comments.create(comment_params)
    if @comment.save
      redirect_to @job
    else
      flash.now[:danger] = 'error'
    end
  end

  def add_resume_comment
    @resume = Resume.find(params[:resume_id])
    @resume = @resume.comments.create(comment_params)
    if @comment.save
      redirect_to @resume
    else
      flash.now[:danger] = 'error'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:ctext)
  end

end
