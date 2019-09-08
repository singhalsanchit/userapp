class SecretCodesController < ApplicationController
  before_action :set_secret_code, only: [:show, :edit, :update, :destroy]
  # load_and_authorize_resource

  # GET /secret_codes
  def index
    @secret_codes = SecretCode.all
  end

  # GET /secret_codes/1
  def show; end

  # GET /secret_codes/new
  def new
    @secret_code = SecretCode.new
  end

  # GET /secret_codes/1/edit
  def edit; end

  # POST /secret_codes
  def create
    @number = params[:number]
    @number.to_i.times.each do |i|
      str = (0...50).map { ('a'..'z').to_a[rand(26)] }.join
      @secret_code = SecretCode.new
      @secret_code.code = str
      @secret_code.save
    end
    respond_to do |format|
        format.html { redirect_to @secret_code, notice: 'Secret code was successfully created.' }
        format.json { render :show, status: :created, location: @secret_code }
    end
  end

  # PATCH/PUT /secret_codes/1
  def update
    respond_to do |format|
      if secret_code_params.present? && @secret_code.update(secret_code_params)
        format.html { redirect_to @secret_code, notice: 'Secret code was successfully updated.' }
        format.json { render :show, status: :ok, location: @secret_code }
      else
        format.html { render :edit }
        format.json { render json: @secret_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /secret_codes/1
  def destroy
    @secret_code.destroy
    respond_to do |format|
      format.html { redirect_to secret_codes_url, notice: 'Secret code was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_secret_code
      @secret_code = SecretCode.find(params[:id])
    end

    def secret_code_params
      params.require(:secret_code).permit(:user_id, :code)
    end
end
