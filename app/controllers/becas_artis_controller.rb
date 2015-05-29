#encoding: utf-8
class BecasArtisController < ApplicationController
	before_action :signed_in_user, only: [:new, :show, :create, :index, :edit, :update]

	def new
		@beca_artis = BecaArtis.new
	end

	def show
		@beca_artis = BecaArtis.find(params[:id])
	end

	def index
		@tramites = current_user.tramites.where(tramitable_type: 'BecaArtis') ? current_user.tramites.where(tramitable_type: 'BecaArtis') : []
	end

	def create
    @beca_artis = BecaArtis.new(beca_artis_params)
    @beca_artis.saltear_validaciones_de_presencia = true
    if @beca_artis.save
      @tramite = current_user.tramites.create!()
      @tramite.tramitable = @beca_artis
      if @tramite.save
        flash[:success] = "Solicitud correctamente creada"
        redirect_to beca_artis_path(@beca_artis)
      end
    else
      render 'new'
    end
	end

	def edit
		@beca_artis = BecaArtis.find(params[:id])
	end

	def update
		@beca_artis = BecaArtis.find(params[:id])
		@beca_artis.saltear_validaciones_de_presencia = true
		if @beca_artis.update_attributes(beca_artis_params)
			flash[:success] = "Formulario actualizado"
			redirect_to beca_artis_path(@beca_artis)
		else
			render 'edit'
		end
	end

  def destroy
    if BecaArtis.find(params[:id]).destroy
      flash[:success] = "Solicitud eliminada"
      redirect_to becas_artis_path
    else
      flash.now[:failure] = "La solicitud no puede ser eliminada"
      render 'index'
    end
  end

	private
		def beca_artis_params
			params.require(:beca_artis).permit(:nombre, :apellido, :num_cuit, :detalle)
		end
end
