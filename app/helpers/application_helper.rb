module ApplicationHelper
  def format_date(date)
    DateTime.parse(date).strftime('%m/%d/%Y at %l:%M%P')
  end
end
