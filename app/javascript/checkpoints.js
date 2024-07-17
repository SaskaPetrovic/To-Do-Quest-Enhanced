document.addEventListener('DOMContentLoaded', () => {
  const addStepButton = document.getElementById('add-step');
  const stepsDiv = document.getElementById('steps');

  let stepIndex = 0;
console.log(addStepButton)
  addStepButton.addEventListener('click', (event) => {
    event.preventDefault();

    const newStep = document.createElement('div');
    newStep.innerHTML = `
      <div>
        <label for="task_steps_attributes_${stepIndex}_title">Step Title</label>
        <input type="text" name="task[steps_attributes][${stepIndex}][title]" id="task_steps_attributes_${stepIndex}_title" required>
      </div>
      <div>
        <label for="task_steps_attributes_${stepIndex}_description">Description</label>
        <input type="text" name="task[steps_attributes][${stepIndex}][description]" id="task_steps_attributes_${stepIndex}_description" required>
      </div>
      <div>
        <label for="task_steps_attributes_${stepIndex}_completed">Completed</label>
        <input type="checkbox" name="task[steps_attributes][${stepIndex}][completed]" id="task_steps_attributes_${stepIndex}_completed">
      </div>
    `;

    stepsDiv.appendChild(newStep);
    stepIndex++;
  });
});
