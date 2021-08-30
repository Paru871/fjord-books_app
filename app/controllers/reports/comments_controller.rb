# frozen_string_literal: true

class Reports::CommentsController < CommentsController
  before_action :set_commentable
  before_action :set_report
  before_action :set_commentable_render

  private

  def set_commentable
    @commentable = Report.find(params[:report_id])
  end

  def set_report
    @report = Report.find(params[:report_id])
  end

  def set_commentable_render
    @commentable_render = 'reports/show'
  end
end
