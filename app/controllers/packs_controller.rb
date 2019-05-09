class PacksController < ApplicationController
  def packed_measures
    render json: BoxifyService.setup_measures(packages_params)
  rescue StandardError => e
    render_message =
      if e.class.name == 'RuntimeError'
        e.message
      else
        'No se pudo calcular medidas, revisa los parámetros.'
      end
    render json: { state: :error, message: render_message }, status: :bad_request
  end

  private

  def packages_params
    params.permit(packages: %i[width length height quantity weight])
  end
end
