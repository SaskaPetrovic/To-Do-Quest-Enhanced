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
    this.barTarget.outerHTML = `
      <div class="progress" data-progress-target="bar" style="height: 40px;">
        <div class="progress-bar" role="progressbar" style="width: ${this.percentage}%;" aria-valuenow="${this.percentage}" aria-valuemin="0" aria-valuemax="100">
          ${this.percentage}%
        </div>
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
    const taskId = formData.get('task[]')

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
        this.deleteTask(taskId)
      } else {
        alert("An error occurred while validating rewards.")
      }
    })
    .catch(error => {
      console.error("Error:", error)
    })
  }

  deleteTask(taskId) {
    fetch(`/tasks/${taskId}`, {
      method: 'DELETE',
      headers: {
        'Accept': 'application/json',
        'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
      }
    })
    .then(response => {
      if (response.ok) {
        window.location.href = '/tasks'
      } else {
        return response.json().then(data => {
          alert(data.error || "An error occurred while deleting the task.")
        })
      }
    })
    .catch(error => {
      console.error("Error:", error)
    })
  }

  completeTask(event) {
    event.preventDefault()
    const button = event.currentTarget
    const taskId = button.dataset.taskId

    fetch(`/tasks/${taskId}/completed`, {
      method: 'PATCH',
      headers: {
        'Accept': 'application/json',
        'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
      }
    })
    .then(response => response.json())
    .then(data => {
      if (data.success) {
        this.showPopup()
      } else {
        alert("An error occurred while completing the task.")
      }
    })
    .catch(error => {
      console.error("Error:", error)
    })
  }
}
