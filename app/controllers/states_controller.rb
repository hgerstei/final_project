class StatesController < ApplicationController
  def index
    @q = State.ransack(params[:q])
    @states = @q.result(:distinct => true).includes(:category, :recipes, :recommendation).page(params[:page]).per(10)

    render("states/index.html.erb")
  end

  def show
    @recipe = Recipe.new
    @state = State.find(params[:id])

    render("states/show.html.erb")
  end

  def new
    @state = State.new

    render("states/new.html.erb")
  end

  def create
    @state = State.new

    @state.category_id = params[:category_id]
    @state.stage1 = params[:stage1]
    @state.stage2 = params[:stage2]
    @state.stage3 = params[:stage3]
    @state.stage4 = params[:stage4]

    save_status = @state.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/states/new", "/create_state"
        redirect_to("/states")
      else
        redirect_back(:fallback_location => "/", :notice => "State created successfully.")
      end
    else
      render("states/new.html.erb")
    end
  end

  def edit
    @state = State.find(params[:id])

    render("states/edit.html.erb")
  end

  def update
    @state = State.find(params[:id])

    @state.category_id = params[:category_id]
    @state.stage1 = params[:stage1]
    @state.stage2 = params[:stage2]
    @state.stage3 = params[:stage3]
    @state.stage4 = params[:stage4]

    save_status = @state.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/states/#{@state.id}/edit", "/update_state"
        redirect_to("/states/#{@state.id}", :notice => "State updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "State updated successfully.")
      end
    else
      render("states/edit.html.erb")
    end
  end

  def destroy
    @state = State.find(params[:id])

    @state.destroy

    if URI(request.referer).path == "/states/#{@state.id}"
      redirect_to("/", :notice => "State deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "State deleted.")
    end
  end
end
