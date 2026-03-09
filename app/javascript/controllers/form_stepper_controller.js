import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["panel", "dot", "prevBtn", "nextBtn", "submitBtn", "currentStepText", "currentStepLabel"]
    static values = { step: { type: Number, default: 1 } }

    connect() {
        this.labels = ["Osobné údaje", "Údaje o behu", "Potvrdenie"]
        this.updateView()
    }

    next() {
        if (this.validateCurrentStep()) {
            this.stepValue = Math.min(3, this.stepValue + 1)
            this.updateView()
            this.scrollToTop()
        }
    }

    prev() {
        this.stepValue = Math.max(1, this.stepValue - 1)
        this.updateView()
        this.scrollToTop()
    }

    validateCurrentStep() {
        const currentPanel = this.panelTargets[this.stepValue - 1]
        const inputs = currentPanel.querySelectorAll("input, select, textarea")
        for (const field of inputs) {
            if (!field.checkValidity()) {
                field.reportValidity()
                return false
            }
        }
        return true
    }

    updateView() {
        this.panelTargets.forEach((panel, i) => {
            panel.classList.toggle("hidden", i + 1 !== this.stepValue)
        })

        this.dotTargets.forEach((dot, i) => {
            const active = (i + 1 <= this.stepValue)
            dot.classList.toggle("bg-primary", active)
            dot.classList.toggle("text-white", active)
            dot.classList.toggle("bg-slate-300", !active)
            dot.classList.toggle("text-slate-700", !active)
        })

        if (this.hasCurrentStepTextTarget) this.currentStepTextTarget.textContent = this.stepValue
        if (this.hasCurrentStepLabelTarget) this.currentStepLabelTarget.textContent = this.labels[this.stepValue - 1]

        this.prevBtnTarget.classList.toggle("hidden", this.stepValue === 1)
        this.nextBtnTarget.classList.toggle("hidden", this.stepValue === 3)
        this.submitBtnTarget.classList.toggle("hidden", this.stepValue !== 3)
    }

    scrollToTop() {
        requestAnimationFrame(() => {
            this.element.scrollIntoView({ behavior: "smooth", block: "start" })
        })
    }
}
