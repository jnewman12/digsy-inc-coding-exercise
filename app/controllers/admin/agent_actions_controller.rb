class Admin::AgentActionsController < ApplicationController

  def new
  end

  def create
    @aa = AgentAction.new(aa_params)

    if @aa.save
      flash[:success] = 'Agent Action Created!'
      redirect_to admin_index_path
    else
      flash[:danger] = @aa.errors.full_messages.to_sentence
      redirect_to :back
    end
  end

  def update
    @aa = AgentAction.find(params[:id])

    if params[:performed] || params[:ignored]
      if params[:performed]
        ActionService.update_aa_performed(@aa)
        ActionService.action_performed("marked as performed", request)
        flash[:success] = 'Agent Action Updated!'
        redirect_to :back
      else
        ActionService.update_aa_ignored(@aa)
        ActionService.action_performed("marked as ignored", request)
        flash[:success] = 'Agent Action Updated!'
        redirect_to :back
      end
    end
  end

  def destroy
    aa = AgentAction.find(params[:id])
    aa.destroy
    flash[:success] = "Agent Action Destroyed!"
    redirect_to :back
  end

  private
  def aa_params
    params.require(:agent_action).permit(:title, :image_link)
  end
end