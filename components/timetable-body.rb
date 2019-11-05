class Oyotei < Ovto::App
  class TimetableBody < Ovto::Component
    def render
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
