import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static classes = ['active']
  static targets = ["btn", "tab"]
  static values = {defaultTab: String}

  connect() {
    this.showDefaultTab()
  }

  showDefaultTab() {
    // Hide all tabs initially
    this.tabTargets.forEach(tab => {
      tab.hidden = true;
      tab.classList.remove('active');
    });

    // Activate the default tab and its button
    const defaultTab = this.tabTargets.find(tab => tab.id === this.defaultTabValue);
    if (defaultTab) {
      defaultTab.hidden = false;
      defaultTab.classList.add('active');

      const defaultBtn = this.btnTargets.find(btn => btn.dataset.tabsTarget === 'btn' && btn.id.includes(this.defaultTabValue));
      if (defaultBtn) {
        defaultBtn.classList.add(...this.activeClasses);
      }
    }
  }

  select(event) {
    const selectedBtn = event.currentTarget;
    const selectedTabId = selectedBtn.id.replace('-btn', '');
    const selectedTab = this.tabTargets.find(tab => tab.id === selectedTabId);

    if (selectedTab) {
      // Hide all tabs and deactivate all buttons
      this.tabTargets.forEach(tab => {
        tab.hidden = true;
        tab.classList.remove('active');
      });
      this.btnTargets.forEach(btn => btn.classList.remove(...this.activeClasses));

      // Show the selected tab and activate the selected button
      selectedTab.hidden = false;
      selectedTab.classList.add('active');
      selectedBtn.classList.add(...this.activeClasses);
    }
  }
}
