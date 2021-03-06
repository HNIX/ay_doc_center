class CategoriesController < ApplicationController
  
  load_and_authorize_resource

  # GET /categories
  # GET /categories.json
  def index
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
  end

  # GET /categories/new
  def new
    @category = Category.new(:parent_id => params[:parent_id])
    @category_tree = ancestry_options(Category.where(nil).arrange(:order => 'name')) {|i| "#{'-' * i.depth} #{i.name}" }
  end

  # GET /categories/1/edit
  def edit
    @category_tree = ancestry_options(Category.where(nil).arrange(:order => 'name')) {|i| "#{'-' * i.depth} #{i.name}" }
  end

  # POST /categories
  # POST /categories.json
  def create
    respond_to do |format|
      if @category.save
        format.html { redirect_to current_user, notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to current_user, notice: 'Category was successfully updated.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to current_user, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def ancestry_options(items, &block)
      return ancestry_options(items){ |i| "#{'-' * i.depth} #{i.name}" } unless block_given?

      result = []
      items.map do |item, sub_items|
        result << [yield(item), item.id]
        #this is a recursive call:
        result += ancestry_options(sub_items, &block)
      end
      result
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:name, :desc, :is_private, :is_writable, :is_featured, :parent_id)
    end
end
