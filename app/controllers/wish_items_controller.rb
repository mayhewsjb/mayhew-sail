class WishItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_wish_item, only: %i[ show edit update destroy ]

  # GET /wish_items
  def index
    @wish_items = WishItem.all
    @wish_items_total = WishItem.sum(:price)
    @wish_items_paid = WishItem.where(paid_for: true).sum(:price)
    @wish_items_remaining = WishItem.where(paid_for: false).sum(:price)
  end

  # GET /wish_items/1
  def show
  end

  # GET /wish_items/new
  def new
    @wish_item = WishItem.new
  end

  # GET /wish_items/1/edit
  def edit
  end

  # POST /wish_items
  def create
    @wish_item = WishItem.new(wish_item_params)

    if @wish_item.save
      redirect_to wish_item_url(@wish_item), notice: "Wish item was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /wish_items/1
  def update
    if @wish_item.update(wish_item_params)
      redirect_to wish_item_url(@wish_item), notice: "Wish item was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /wish_items/1
  def destroy
    @wish_item.destroy
    redirect_to wish_items_url, notice: "Wish item was successfully destroyed."
  end

  def admin_index
    @wish_item = WishItem.all
    @wish_items_total = WishItem.sum(:price)
    @wish_items_paid = WishItem.where(paid_for: true).sum(:price)
    @wish_items_remaining = WishItem.where(paid_for: false).sum(:price)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wish_item
      @wish_item = WishItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def wish_item_params
      params.require(:wish_item).permit(:name, :price, :use, :paid_for)
    end
end
