class PrefetchesController < ApplicationController
  before_action :set_prefetch, only: [:show, :edit, :update, :destroy]

  # GET /prefetches
  # GET /prefetches.json
  def index
		from = Time.now.at_beginning_of_day
		to   = from + 1.day

    @prefetches = Prefetch.where(created_at: from...to)
		@new_pre = 0
		@che_pre = 0
		@inf_pre = 0
		
		@prefetches.each do |pre|
			case pre.types
			when "新規受付"
				@new_pre+=1
			when "機種変更"
				@che_pre+=1
			when "情報変更"
				@inf_pre+=1
			end
		end
		
		@un_charged = 0
		@charged = 0
		@charge_all = 0
		Card.where(created_at: from...to).each do |card|
			(card.charged)? @charged+=1 : @un_charged += 1
			@charged+=1
		end
		
  end

  # GET /prefetches/1
  # GET /prefetches/1.json
  def show
  end

  # GET /prefetches/new
  def new
    @prefetch = Prefetch.new
  end

  # GET /prefetches/1/edit
  def edit
  end

  # POST /prefetches
  # POST /prefetches.json
  def create
    @prefetch = Prefetch.new(prefetch_params)
		
		if @prefetch.save
			redirect_to :root,notice:"登録したよー(・∀・)！"
		else
			redirect_to :root,notice:"登録できんかったよ(；・∀・)"
		end
  end

  # PATCH/PUT /prefetches/1
  # PATCH/PUT /prefetches/1.json
  def update
    respond_to do |format|
      if @prefetch.update(prefetch_params)
        format.html { redirect_to @prefetch, notice: 'Prefetch was successfully updated.' }
        format.json { render :show, status: :ok, location: @prefetch }
      else
        format.html { render :edit }
        format.json { render json: @prefetch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prefetches/1
  # DELETE /prefetches/1.json
  def destroy
    @prefetch.destroy
    respond_to do |format|
      format.html { redirect_to prefetches_url, notice: 'Prefetch was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prefetch
      @prefetch = Prefetch.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def prefetch_params
      params.require(:prefetch).permit(:types)
    end
end
