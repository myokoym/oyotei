class Oyotei < Ovto::App
  class TimeRange < Ovto::Component
    def render
      o "p" do
        o "select", {
          onchange: ->(e){ actions.set_begin_time(value: e.target.value) }
        } do
          (state.raw_begin_time..state.end_time).each do |i|
            options = {value: i}
            if i == state.begin_time
              options[:selected] = "selected"
            end
            o "option", options, i
          end
        end

        o "span", "-"

        o "select", {
          onchange: ->(e){ actions.set_end_time(value: e.target.value) }
        } do
          (state.begin_time...state.raw_end_time).each do |i|
            options = {value: i}
            if i == state.end_time
              options[:selected] = "selected"
            end
            o "option", options, i
          end
        end
      end
    end
  end
end
