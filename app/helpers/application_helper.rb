module ApplicationHelper
    def render_markdown(str)
        markdown = Redcarpet::Markdown.new(
            Redcarpet::Render::HTML,
            :autolink => true, 
            :space_after_headers => true, 
            :no_intra_emphasis => true
        ).render(str).html_safe
    end

    def title
        "argeli.us"
    end

    def author
        "Andreas Argelius"
    end

    def sub_title
        "development blog"
    end
end
