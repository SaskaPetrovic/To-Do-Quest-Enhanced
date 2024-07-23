import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="progress"
export default class extends Controller {
  static targets = ["checkboxes", "bar", "checkbox", "popup"]

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
    <div class="progress-bar" role="progressbar" style="width: ${this.percentage}%;" aria-valuenow="${this.percentage}" aria-valuemin="0" aria-valuemax="100"> ${this.percentage}%</div>
    </div>`

    if (this.percentage >= 100) {
      this.showPopup()
    }
  }

  showPopup() {
    this.popupTarget.classList.remove("hidden")
  }

  closePopup() {
    this.popupTarget.classList.add("hidden")
  }

  handleRewardValidation(event) {
    event.preventDefault()
    const form = event.target
    const formData = new FormData(form)

    fetch(form.action, {
      method: 'POST',
      headers: {
        'Accept': 'application/json',
        'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
      },
      body: formData
    })
    .then(response => response.json())
    .then(data => {
      if (data.success) {
        this.closePopup()
        // Optionally update the UI or notify the user
      } else {
        alert("An error occurred while validating rewards.")
      }
    })
    .catch(error => {
      console.error("Error:", error)
    })
  }
}
