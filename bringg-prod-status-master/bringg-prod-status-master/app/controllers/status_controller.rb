class StatusController < ApplicationController
  def index
    @status = Status.last
    @last_ten = Status.last(10)
  end

  def create


    if params[:incident_date]
      params.require(:incident_description)
      params.require(:incident_date)
      params.require(:incident_origin)
      params[:incident_date] = DateTime.new(params[:incident_date]["(1i)"].to_i,
                                            params[:incident_date]["(2i)"].to_i,
                                            params[:incident_date]["(3i)"].to_i,
                                            params[:incident_date]["(4i)"].to_i,
                                            params[:incident_date]["(5i)"].to_i)
      params[:created_by_user] = current_user.id
      @status = Status.create(create_status_params)
      redirect_to action: "index"
    else
      render 'create'
    end
  end

  private

  def create_status_params
    params.permit(:incident_description, :incident_date, :incident_origin, :created_by_user)
  end
end
