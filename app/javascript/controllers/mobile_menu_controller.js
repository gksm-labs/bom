import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["menu", "panel", "button"]

    open() {
        this.menuTarget.classList.remove("opacity-0", "pointer-events-none")

        requestAnimationFrame(() => {
            this.panelTarget.classList.remove("translate-y-6")
        })

        document.body.classList.add("overflow-hidden")
        if (this.hasButtonTarget) this.buttonTarget.setAttribute("aria-expanded", "true")
    }

    close() {
        this.panelTarget.classList.add("translate-y-6")
        this.menuTarget.classList.add("opacity-0", "pointer-events-none")

        document.body.classList.remove("overflow-hidden")
        if (this.hasButtonTarget) this.buttonTarget.setAttribute("aria-expanded", "false")
    }
}
