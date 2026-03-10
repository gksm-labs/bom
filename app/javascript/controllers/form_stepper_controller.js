import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["panel", "dot", "prevBtn", "nextBtn", "submitBtn", "currentStepText", "currentStepLabel"]

    static values = {
        step: { type: Number, default: 1 },
        labels: { type: Array, default: [] }
    }

    connect() {
        this.updateView()
    }

    get totalSteps() {
        return this.panelTargets.length
    }

    next() {
        if (this.validateCurrentStep()) {
            this.stepValue = Math.min(this.totalSteps, this.stepValue + 1)
            this.updateView()
            this.scrollToCenter()
        }
    }

    prev() {
        this.stepValue = Math.max(1, this.stepValue - 1)
        this.updateView()
        this.scrollToCenter()
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

        if (this.hasCurrentStepTextTarget) {
            this.currentStepTextTarget.textContent = this.stepValue
        }

        if (this.hasCurrentStepLabelTarget && this.labelsValue.length > 0) {
            this.currentStepLabelTarget.textContent = this.labelsValue[this.stepValue - 1]
        }

        this.prevBtnTarget.classList.toggle("hidden", this.stepValue === 1)
        this.nextBtnTarget.classList.toggle("hidden", this.stepValue === this.totalSteps)
        this.submitBtnTarget.classList.toggle("hidden", this.stepValue !== this.totalSteps)
    }

    scrollToCenter() {
        requestAnimationFrame(() => {
            this.element.scrollIntoView({ behavior: "smooth", block: "center" })
        })
    }
}
