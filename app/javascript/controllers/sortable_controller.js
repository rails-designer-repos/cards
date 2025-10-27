import { Controller } from "@hotwired/stimulus"
import { Sortable, MultiDrag } from "sortablejs"
import { patch } from "@rails/request.js"

Sortable.mount(new MultiDrag())

export default class extends Controller {
  static values = { groupName: String, endpoint: String, multiDraggable: Boolean };

  connect() {
    Sortable.create(this.element,
      {
        group: this.groupNameValue,
        draggable: "[draggable]",
        animation: 250,
        easing: "cubic-bezier(1, 0, 0, 1)",

        ghostClass: "opacity-50",
        selectedClass: "selected",

        multiDrag: this.multiDraggableValue,
        multiDragKey: "shift",

        onEnd: (event) => this.#updatePosition(event)
      }
    )
  }

  // private

  async #updatePosition(event) {
    const items = event.items?.length > 0 ? event.items : [event.item]
    const ids = items.map(item => item.dataset.sortableIdValue)

    await patch(
      this.endpointValue,
      {
        body: JSON.stringify({
          ids: ids,
          board_column_id: event.to.dataset.sortableListIdValue,
          new_position: event.newIndex + 1
        })
      }
    )
  }
}
