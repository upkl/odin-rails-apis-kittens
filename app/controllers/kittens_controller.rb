class KittensController < ApplicationController
  def index
    @kittens = Kitten.all
  end

  def show
    @kitten = Kitten.find(params[:id])
  end

  def destroy
    @kitten = Kitten.find(params[:id])
    name = @kitten.name
    @kitten.destroy
    redirect_to kittens_path, notice: "#{name} has vanished."
  end

  def create
    @kitten = Kitten.new(kitten_params)
    if @kitten.save
      redirect_to @kitten, notice: "Congratulations, #{@kitten.name} is alive!"
    else
      flash.alert = 'Try again!!'
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @kitten = Kitten.new
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end

  def update
    @kitten = Kitten.find(params[:id])
    if @kitten.update(kitten_params)
      redirect_to @kitten, notice: "Hm, #{@kitten.name} looks different now!"
    else
      flash.alert = 'Your kitten does not want to change.'
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end
end
