class TelephonesController < ApplicationController
  # GET /telephones
  # GET /telephones.json
  def index


if params[:commit]=="search" && params[:q]=='' && (params[:a]=="0" ||params[:a]=="1"||params[:a]=="2")

  	 @telephones = Telephone.all

elsif params[:a]=="2" && params[:a]=="0"

     	@telephones=Telephone.where(" name LIKE ? ", "#{params[:q]}%")

elsif params[:a]=="1" 

	@telephones=Telephone.where("name = ?", params[:q])

else
	@telephones=Telephone.where("name = ?", params[:q])

end


   respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @telephones }
    end
  end

  # GET /telephones/1
  # GET /telephones/1.json
  def show
    @telephone = Telephone.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @telephone }
    end
  end

  # GET /telephones/new
  # GET /telephones/new.json
  def new
    @telephone = Telephone.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @telephone }
    end
  end

  # GET /telephones/1/edit
  def edit
    @telephone = Telephone.find(params[:id])
  end

  # POST /telephones
  # POST /telephones.json
  def create
    @telephone = Telephone.new(params[:telephone])

    respond_to do |format|
      if @telephone.save
        format.html { redirect_to @telephone, notice: 'Telephone was successfully created.' }
        format.json { render json: @telephone, status: :created, location: @telephone }
      else
        format.html { render action: "new" }
        format.json { render json: @telephone.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /telephones/1
  # PUT /telephones/1.json
  def update
    @telephone = Telephone.find(params[:id])

    respond_to do |format|
      if @telephone.update_attributes(params[:telephone])
        format.html { redirect_to @telephone, notice: 'Telephone was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @telephone.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /telephones/1
  # DELETE /telephones/1.json
  def destroy
    @telephone = Telephone.find(params[:id])
    @telephone.destroy

    respond_to do |format|
      format.html { redirect_to telephones_url }
      format.json { head :no_content }
    end
  end
end
