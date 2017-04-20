class Admin::MainController < ApplicationController

  def index
    @agent_actions = AgentAction.all
  end

end