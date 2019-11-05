class Oyotei < Ovto::App
  class Timetable < Ovto::Component
    def render
      o "div" do
        o "ul", {class: "nav nav-tabs"} do
          o "li", {class: "nav-item"} do
            o "a", {href: "#graphical", class: "nav-link active", "data-toggle": "tab"}, "Graphical"
          end
          o "li", {class: "nav-item"} do
            o "a", {href: "#text", class: "nav-link", "data-toggle": "tab"}, "Text"
          end
        end

        o "div", {class: "tab-content"} do
          o "div", {id: "graphical", class: "tab-pane active"} do
            o "table", {class: "table"} do
              o "thead" do
                o "tr" do
                  o "th", {scope: "col"}, "time"
                  o "th", {scope: "col"}, "content"
                end
              end
              o "tbody" do
                state.schedules.each do |schedule|
                  o "tr" do
                    o "th", {scope: "row"}, state.formatted_time(schedule[0])
                    o "td", schedule[1]
                  end
                end
              end
            end
          end

          o "div", {id: "text", class: "tab-pane"} do
            o "textarea", {cols: "40", rows: "24"}, state.text_schedules
          end
        end
      end
    end
  end
end
