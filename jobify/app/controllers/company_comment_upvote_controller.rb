class CompanyCommentUpvoteController < ApplicationController

  def add_company_comment_upvote
    @comment = Comment.find(params[:comment_id])
    @comment.company_comment_upvote.create(:student_id => session[:user_id])
    #@comment.compnay_comment_upvote.average(:rating)
    #@company.save
    @company = @comment.company
      redirect_to @company
   end

end
