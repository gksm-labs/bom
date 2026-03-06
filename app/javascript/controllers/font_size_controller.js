import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["button"]
    static values = {
        storageKey: { type: String, default: "bom-font-scale" }
    }

    connect() {
        const saved = Number(localStorage.getItem(this.storageKeyValue))
        this.updateScale(saved || 1)
    }

    apply(event) {
        const scale = Number(event.params.scale)
        this.updateScale(scale)
    }

    updateScale(scale) {
        document.documentElement.style.fontSize = `${scale * 100}%`

        this.element.style.setProperty("--menu-scale", String(1 / scale))

        localStorage.setItem(this.storageKeyValue, String(scale))

        this.buttonTargets.forEach((btn) => {
            const btnScale = Number(btn.dataset.fontSizeScaleParam)
            const isActive = (btnScale === scale)

            btn.setAttribute("aria-pressed", String(isActive))
            btn.classList.toggle("opacity-100", isActive)
            btn.classList.toggle("opacity-70", !isActive)
        })
    }
}
