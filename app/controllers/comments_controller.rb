class CommentsController < ApplicationController
  def create
    project.comments.build(comment_params)

    if project.save
      redirect_to(
        project_path(project),
        notice: "Success"
      )
    else
      flash.now[:alert] = "Error"
      render(
        "project/show",
        locals: {project: project},
        status: :unprocessable_entity
      )
    end
  end

  private

  def comment_params
    {
      body: body,
      user: current_user
    }
  end

  def body
    params.require(:body)
  end

  def project
    @project ||= Project.find(params.require(:project_id))
  end
end
