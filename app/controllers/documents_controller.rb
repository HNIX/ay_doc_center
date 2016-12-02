class DocumentsController < ApplicationController

  load_and_authorize_resource

  # GET /documents
  # GET /documents.json
  def index
    if params[:search]
      @documents = Document.search(params[:search]).order("created_at DESC")
    else
      @documents = Document.all.order('created_at DESC')
    end
  end

  # GET /documents/1
  # GET /documents/1.json
  def show

  end

  # GET /documents/new
  def new
    @categories_doc = ancestry_options(Category.where(nil).arrange(:order => 'name')) {|i| "#{'-' * i.depth} #{i.name}" }
  end

  # GET /documents/1/edit
  def edit
    @categories_doc = ancestry_options(Category.where(nil).arrange(:order => 'name')) {|i| "#{'-' * i.depth} #{i.name}" }
  end

  # POST /documents
  # POST /documents.json
  def create
    @document.user = current_user
    respond_to do |format|
      if @document.save
        @document.create_activity :create, owner: current_user
        format.html { redirect_to @document, notice: 'Document was successfully created.' }
        format.json { render :show, status: :created, location: @document }
      else
        format.html { render :new }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /documents/1
  # PATCH/PUT /documents/1.json
  def update
    respond_to do |format|
      if @document.update(document_params)
        @document.create_activity :update, owner: current_user
        format.html { redirect_to @document, notice: 'Document was successfully updated.' }
        format.json { render :show, status: :ok, location: @document }
      else
        format.html { render :edit }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /documents/1
  # DELETE /documents/1.json
  def destroy
    @document.create_activity :destroy, owner: current_user
    @document.destroy
    respond_to do |format|
      format.html { redirect_to documents_url, notice: 'Document was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  #->Prelang (voting/acts_as_votable)
  def vote

    direction = params[:direction]

    # Make sure we've specified a direction
    raise "No direction parameter specified to #vote action." unless direction

    # Make sure the direction is valid
    unless ["like", "bad"].member? direction
      raise "Direction '#{direction}' is not a valid direction for vote method."
    end

    @document.vote_by voter: current_user, vote: direction

    redirect_to action: :index
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
    def document_params
      params.require(:document).permit(:user_id, :name, :desc, :is_private, :is_writable, :category_id, :attachment, :word, :ppt, :remove_attachment, :word_cache, :remove_word, :remove_ppt, :ppt_cache, :tag_list)
    end
end
