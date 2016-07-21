class CompanyStatsController < ApplicationController
  load_and_authorize_resource

  def index

  end

  def show
  end

  def new

  end

  def edit
  end

  def create
      respond_to do |format|
      if @company_stat.save
        @company_stat.create_activity :create, owner: current_user
        format.html { redirect_to @company_stat, notice: 'Stat was successfully created.' }
        format.json { render :show, status: :created, location: @company_stat }
      else
        format.html { render :new }
        format.json { render json: @company_stat.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @company_stat.update(company_stat_params)
        @company_stat.create_activity :update, owner: current_user
        format.html { redirect_to @company_stat, notice: 'Stat was successfully updated.' }
        format.json { render :show, status: :ok, location: @company_stat }
      else
        format.html { render :edit }
        format.json { render json: @company_stat.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @company_stat.destroy
    @company_stat.create_activity :destroy, owner: current_user
    respond_to do |format|
      format.html { redirect_to company_stats_url, notice: 'Stat was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def company_stat_params
      params.require(:company_stat).permit(:name, :stat, :desc, :type)
    end
end
