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
        "Lilliputian"
    end

    def author
        "The Author"
    end

    def sub_title
        "sub title"
    end
end
