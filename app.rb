require 'ovto'

require "components/timetable-nav"
require "components/timetable-body"
require "components/items"

class Oyotei < Ovto::App
  class State < Ovto::State
    item :mode, default: 0
    item :tab, default: 0
    item :items, default: []
    item :schedules, default: (0...24).map {|time| [time, nil] }

    def formatted_time(time)
      "#{time}:00"
    end

    def text_schedules
      schedules.map {|schedule|
        "#{"%02d" % schedule[0]}:00 #{schedule[1]}"
      }.join("\n")
    end
  end

  class Actions < Ovto::Actions
  end

  class MainComponent < Ovto::Component
    def render
      o "div", {class: "row"} do
        o "div", {class: "col-sm-8"} do
          o TimetableNav
          o TimetableBody
        end
        o "div", {class: "col-sm-4"} do
          o Items
        end
      end
    end
  end
end

Oyotei.run(id: 'ovto')
