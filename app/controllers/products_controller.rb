class ProductsController < ApplicationController
  include CurrentCart
  load_and_authorize_resource :except => [:show]
  before_action :set_cart
  before_action :set_product, only: [:show, :edit, :update, :destroy]


  def index
    # @products = Product.all
    # @uploader = Product.new.image
    # @uploader.success_action_redirect = new_product_url
  end

  def show
  end


  def new
    @product = Product.new
    # @product = Product.new(key: params[:key])
  end

  def edit
  end

  # def download_product
  #   @product = Product.find(1)
  #   redirect_to @product.image.url
  # end

  def download
    @product = Product.find(params[:id])
    data = open(@product.image.url)
    send_file data, :type => data.content_type,
                         :disposition => 'attachment',
                         :filename => @product.title,
                         :stream => true
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)
    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render action: 'show', status: :created, location: @product }
      else
        format.html { render action: 'new' }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end

  def who_bought
    @product = Product.find(params[:id])
    @latest_order = @product.orders.order(:updated_at).latest_order
    if stale?(@latest_order)
      respond_to do |format|
        format.atom
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:title, :description, :wistia_preview, :image, :price, :category, :is_downloadable, :shipping, :visible, {:video_ids => []})
    end
end
