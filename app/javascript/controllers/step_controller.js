import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="step"
export default class extends Controller {
  static targets = ["steps", "template"]

  connect() {
    console.log("Steps controller connected")
    this.stepIndex = 0
  }

  addStep(event) {
    event.preventDefault()
    console.log("Add step button clicked")

    const content = this.templateTarget.innerHTML.replace(/INDEX/g, this.stepIndex)
    this.stepsTarget.insertAdjacentHTML('beforeend', content)
    this.stepIndex++
  }
}
