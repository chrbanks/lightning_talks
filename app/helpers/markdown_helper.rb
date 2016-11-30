module MarkdownHelper
  def markdown(text)
    unless text.blank?
      MarkdownPipeline.call(text)[:output].to_s.html_safe
    end
  end
end
