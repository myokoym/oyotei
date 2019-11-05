class Oyotei < Ovto::App
  class Items < Ovto::Component
    def render
      o "input", {
        type: "text",
        onchange: ->(e){ actions.set_item(value: e.target.value) },
        value: state.items[0]
      }
    end
  end
end
