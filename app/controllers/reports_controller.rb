class ReportsController < ApplicationController
  before_action :set_text, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /texts
  # GET /texts.json
  def index
    which_texts = params[:s]
    texts_search = params[:searchterm]
    if which_texts == nil
      @texts = Text.where("reported = '1'").sort_by {|obj| ((((obj.get_upvotes.size - obj.get_downvotes.size)+1) * 10000000000000000000) / (Time.now.to_i - obj.created_at.to_i)) }.reverse
    end
    if which_texts == 'top'
      @texts = Text.where("reported = '1'").sort_by {|obj| ((obj.get_upvotes.size - obj.get_downvotes.size)+1)}.reverse
    end
    if which_texts == 'hot'
      @texts = Text.where("reported = '1'").sort_by {|obj| ((((obj.get_upvotes.size - obj.get_downvotes.size)+1) * 10000000000000000000) / (Time.now.to_i - obj.created_at.to_i)) }.reverse
    end
    if which_texts == 'new'
      @texts = Text.where("reported = '1'").sort_by {|obj| (Time.now.to_i - obj.created_at.to_i)}
    end
    if texts_search != nil
      @texts = Text.where("title LIKE ? OR content LIKE ? AND reported IS ?", "%#{texts_search}%", "%#{texts_search}%", "1")
    end
  end

  # GET /texts/1
  # GET /texts/1.json
  def show
    redirect_to text_path
  end

  # GET /texts/new
  def new
    redirect_to new_text_path
  end

  # GET /texts/1/edit
  def edit
    redirect_to edit_text_path 
  end

  def report
    @text = Text.find(params[:id])
    @text.update_attribute(:reported, "True")
    redirect_back fallback_location: root_path
end
  # GET /texts/new
  #UPVOTE
  def upvote
    @text = Text.find(params[:id])
    @text.upvote_by current_user
    redirect_back fallback_location: root_path
  end

  #UNUPVOTE
  def unlike
    @text = Text.find(params[:id])
    @text.unliked_by current_user
    redirect_back fallback_location: root_path
  end  
  #UNDOWNVOTE
  def undislike
    @text = Text.find(params[:id])
    @text.undisliked_by current_user
    redirect_back fallback_location: root_path
  end    

  #DOWNVOTE
  def downvote
    @text = Text.find(params[:id])
    @text.downvote_by current_user
    redirect_back fallback_location: root_path
  end

  # POST /texts
  # POST /texts.json
  def create
    @text = current_user.texts.build(text_params)

    respond_to do |format|
      if @text.save
        format.html { redirect_to @text, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @text }
      else
        format.html { render :new }
        format.json { render json: @text.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /texts/1
  # PATCH/PUT /texts/1.json
  def update
    respond_to do |format|
      if @text.update(text_params)
        format.html { redirect_to @text, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @text }
      else
        format.html { render :edit }
        format.json { render json: @text.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /texts/1
  # DELETE /texts/1.json
  def destroy
    @text.destroy
    respond_to do |format|
      format.html { redirect_to texts_url, notice: 'Post was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_text
      @text = Text.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def text_params
      params.require(:text).permit(:title, :content, :texttype, :reported)
    end
end
