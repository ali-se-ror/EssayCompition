class EssaysController < ApplicationController
  before_action :set_essay, only: %i[ show edit update destroy ]

  # GET /essays or /essays.json
  def index
    @essays = current_user.essays
  end

  def my_rewards
    @rewards = current_user.rewards
  end

  # GET /essays/1 or /essays/1.json
  def show
  end

  # GET /essays/new
  def new
    @essay =  Essay.submitted(current_user.id) ? Essay.new :  nil
  end

  # GET /essays/1/edit
  def edit
  end

  # POST /essays or /essays.json
  def create
    @essay = Essay.new(essay_params)

    respond_to do |format|
      if @essay.save
        format.html { redirect_to essay_url(@essay), notice: "Essay was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /essays/1 or /essays/1.json
  def update
    respond_to do |format|
      if @essay.update(essay_params)
        format.html { redirect_to essay_url(@essay), notice: "Essay was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /essays/1 or /essays/1.json
  def destroy
    @essay.destroy

    respond_to do |format|
      format.html { redirect_to essays_url, notice: "Essay was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_essay
      @essay = Essay.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def essay_params
      (params.require(:essay).permit(:title, :body)).merge(user_id: current_user.id)
    end
end
