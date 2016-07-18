class CompanyStatsController < ApplicationController
  before_action :set_company_stat, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @company_stats = CompanyStat.all
    respond_with(@company_stats)
  end

  def show
    respond_with(@company_stat)
  end

  def new
    @company_stat = CompanyStat.new
    respond_with(@company_stat)
  end

  def edit
  end

  def create
    @company_stat = CompanyStat.new(company_stat_params)
    @company_stat.save
    respond_with(@company_stat)
  end

  def update
    @company_stat.update(company_stat_params)
    respond_with(@company_stat)
  end

  def destroy
    @company_stat.destroy
    respond_with(@company_stat)
  end

  private
    def set_company_stat
      @company_stat = CompanyStat.find(params[:id])
    end

    def company_stat_params
      params.require(:company_stat).permit(:name, :stat, :desc, :type)
    end
end
