import { Controller } from "@hotwired/stimulus"
import Sortable from "sortablejs"
import { patch } from "@rails/request.js"

export default class extends Controller {
  static values = { endpoint: String };

  connect() {
    Sortable.create(this.element,
      {
        draggable: "[draggable]",
        animation: 250,
        easing: "cubic-bezier(1, 0, 0, 1)",

        ghostClass: "opacity-50",

        onEnd: this.#updatePosition.bind(this)
      }
    )
  }

  // private

  async #updatePosition(event) {
    await patch(
      this.endpointValue.replace(/__ID__/g, event.item.dataset.sortableIdValue),
      { body: JSON.stringify({ new_position: event.newIndex + 1 }) }
    )
  }
}
