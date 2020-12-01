module ApplicationHelper
  def format_period(period)
    "#{period.first.strftime('%d.%m.%Y %H:%M')} - #{period.last.strftime('%d.%m.%Y %H:%M')}"
  end

  def format_languages(languages)
    languages.map(&:name).join(', ')
  end
end
