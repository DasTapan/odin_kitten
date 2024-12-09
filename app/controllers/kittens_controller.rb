class KittensController < ApplicationController
  def index
    @kittens = Kitten.all

    respond_to do |format|
      format.html 
      format.xml {render :xml => @kittens}
      format.json {render :json => @kittens}
    end
  end

  def show
    @kitten = Kitten.find(params[:id])
    
    respond_to do |format|
      format.html
      format.xml {render :xml => @kitten}
      format.json {render :json => @kitten}
    end
  end

  def new
    @kitten = Kitten.new
  end

  def create
    cuteness = kitten_params[:cuteness].to_i
    softness = kitten_params[:softness].to_i
    @kitten = Kitten.new(kitten_params.merge(cuteness: cuteness, softness: softness))

    if @kitten.save
      redirect_to @kitten, flash: {notice: "New kitten has arrived"}
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end

  def update
    @kitten = Kitten.find(params[:id])

    if @kitten.update(kitten_params)
      redirect_to @kitten, flash: {notice: "Kitten got new power"}
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @kitten = Kitten.find(params[:id])
    @kitten.destroy
    flash[:notice] = "Deleted Permanently"

    redirect_to root_path, status: :see_other
  end

  private

  def kitten_params
    params.require(:kitten).permit(
      :name,
      :age,
      :cuteness,
      :softness
    )
  end
end
