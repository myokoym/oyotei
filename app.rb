require 'ovto'

require "components/timetable-nav"
require "components/timetable-body"
require "components/items"

class Oyotei < Ovto::App
  class State < Ovto::State
    item :mode, default: 0
    item :tab, default: 0
    item :items, default: ["lunch"]
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
    def set_item(value: value)
      new_items = state.items.map {|item| item.dup}
      new_items[0] = value
      return {items: new_items}
    end

    def update_schedule(time: time)
      new_schedules = state.schedules.map do |schedule|
        new_schedule = schedule.dup
        if new_schedule[0] == time
          new_schedule[1] = state.items[0]
        end
        new_schedule
      end
      return {schedules: new_schedules}
    end
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
