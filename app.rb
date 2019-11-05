require 'ovto'

class Oyotei < Ovto::App
  class State < Ovto::State
    item :mode, default: 0
    item :tab, default: 0
    item :items, default: []
    item :schedules, default: (0...24).map {|time| [time, nil] }

    def formatted_time(time)
      "#{time}:00"
    end
  end

  class Actions < Ovto::Actions
  end

  class MainComponent < Ovto::Component
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
            o "h2", "dummy"
          end
        end
      end
    end
  end
end

Oyotei.run(id: 'ovto')
