class Oyotei < Ovto::App
  class TimetableNav < Ovto::Component
    def render
      o "ul", {class: "nav nav-tabs"} do
        o "li", {class: "nav-item"} do
          o "a", {href: "#graphical", class: "nav-link active", "data-toggle": "tab"}, "Graphical"
        end
        o "li", {class: "nav-item"} do
          o "a", {href: "#text", class: "nav-link", "data-toggle": "tab"}, "Text"
        end
      end
    end
  end
end
