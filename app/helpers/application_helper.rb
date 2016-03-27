module ApplicationHelper
  def markdown(text)
    @mrenderer ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    @mrenderer.render(text)
  end

  include ActsAsTaggableOn::TagsHelper
end
