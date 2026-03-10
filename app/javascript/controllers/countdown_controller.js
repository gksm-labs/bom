import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["display"]
    static values = { date: String }

    connect() {
        this.targetTime = new Date(this.dateValue).getTime()

        this.render()

        this.timer = setInterval(() => this.render(), 1000)
    }

    disconnect() {
        clearInterval(this.timer)
    }

    render() {
        const now = Date.now()
        const diff = this.targetTime - now

        if (diff <= 0) {
            this.displayTarget.textContent = "00d 00h 00m 00s"
            clearInterval(this.timer)
            return
        }

        const pad = (n) => String(n).padStart(2, "0")

        const days = Math.floor(diff / (1000 * 60 * 60 * 24))
        const hours = Math.floor((diff / (1000 * 60 * 60)) % 24)
        const mins = Math.floor((diff / (1000 * 60)) % 60)
        const secs = Math.floor((diff / 1000) % 60)

        this.displayTarget.textContent = `${pad(days)}d ${pad(hours)}h ${pad(mins)}m ${pad(secs)}s`
    }
}