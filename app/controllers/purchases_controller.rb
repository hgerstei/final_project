class PurchasesController < ApplicationController
  before_action :current_user_must_be_purchase_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_purchase_user
    purchase = Purchase.find(params[:id])

    unless current_user == purchase.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @purchases = Purchase.all

    render("purchases/index.html.erb")
  end

  def show
    @purchase = Purchase.find(params[:id])

    render("purchases/show.html.erb")
  end

  def new
    @purchase = Purchase.new

    render("purchases/new.html.erb")
  end

  def create
    @purchase = Purchase.new

    @purchase.purchase_name = params[:purchase_name]
    @purchase.category_id = params[:category_id]
    @purchase.purchase_date = params[:purchase_date]
    @purchase.notes = params[:notes]
    @purchase.user_id = params[:user_id]

    save_status = @purchase.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/purchases/new", "/create_purchase"
        redirect_to("/purchases")
      else
        redirect_back(:fallback_location => "/", :notice => "Purchase created successfully.")
      end
    else
      render("purchases/new.html.erb")
    end
  end

  def edit
    @purchase = Purchase.find(params[:id])

    render("purchases/edit.html.erb")
  end

  def update
    @purchase = Purchase.find(params[:id])

    @purchase.purchase_name = params[:purchase_name]
    @purchase.category_id = params[:category_id]
    @purchase.purchase_date = params[:purchase_date]
    @purchase.notes = params[:notes]
    @purchase.user_id = params[:user_id]

    save_status = @purchase.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/purchases/#{@purchase.id}/edit", "/update_purchase"
        redirect_to("/purchases/#{@purchase.id}", :notice => "Purchase updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Purchase updated successfully.")
      end
    else
      render("purchases/edit.html.erb")
    end
  end

  def destroy
    @purchase = Purchase.find(params[:id])

    @purchase.destroy

    if URI(request.referer).path == "/purchases/#{@purchase.id}"
      redirect_to("/", :notice => "Purchase deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Purchase deleted.")
    end
  end
end
