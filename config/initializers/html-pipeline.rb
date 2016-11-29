MarkdownPipeline = HTML::Pipeline.new [
  HTML::Pipeline::MarkdownFilter,
  HTML::Pipeline::EmojiFilter,
  HTML::Pipeline::RougeFilter
], asset_root: "/assets", gfm: true
