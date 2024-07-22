import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="progress"
export default class extends Controller {
  static targets = ["checkboxes", "bar", "checkbox"]
  connect() {

   this.updateProgressBar()

  }

  updateProgressBar(event) {

    this.count = 0
    this.checkboxTargets.forEach(element => {
      if (element.checked) {
        this.count += 1
      }
    });
    this.total = this.checkboxTargets.length
    this.percentage = this.count * 100 / this.total
    this.barTarget.outerHTML = ` <div class="progress" data-progress-target="bar">
    <div class="progress-bar" role="progressbar" style="width: ${this.percentage}%;" aria-valuenow=" ${this.percentage}" aria-valuemin="0" aria-valuemax="100"> ${this.percentage}%</div>
    </div>
    `
  }
}
