class GoalsController < ApplicationController
  def index
    @goals = Goal.all
    render :index
  end

  def new
    @goal = Goal.new
    render :new
  end

  def create
    @goal = Goal.new(goal_params)

    if @goal.save
      redirect_to goals_url
    else
      flash.now[:errors] = @goal.errors.full_messages
      render :new
    end
  end

  def update
    @goal = Goal.find(params[:id])

    if @goal.update_attributes(goal_params)
      redirect_to goals_url
    else
      flash.now[:errors] = @goal.errors.full_messages
      render :edit
    end
  end

  def edit
    @goal = Goal.find(params[:id])
    render :edit
  end

  def destroy
    Goal.destroy(params[:id])
    redirect_to goals_url
  end

end
