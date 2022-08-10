class HolidayFacade
  def holidays
    service.get_holiday.first(3).map do |data|
      Holiday.new(data)
    end
  end

  def service
    @service = HolidayService.new
  end
end