require 'ovto'

class Oyotei < Ovto::App
  class State < Ovto::State
    item :mode, default: 0
    item :tab, default: 0
    item :items, default: []
    item :schedules, default: (0...24).map {|time| [time, nil] }
  end

  class Actions < Ovto::Actions
  end

  class MainComponent < Ovto::Component
    def render
      o "div" do
        o "table" do
          o "tbody" do
            state.schedules.each do |schedule|
              o "tr" do
                o "th", schedule[0]
                o "td", schedule[1]
              end
            end
          end
        end
      end
    end
  end
end

Oyotei.run(id: 'ovto')
