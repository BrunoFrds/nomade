import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle-form"
export default class extends Controller {
  connect() {
    console.log("ToggleFormController connected")
  }

  static targets = ["form"]

  // Fonction pour basculer l'affichage du formulaire
  toggle() {
    if (this.formTarget.style.display === "none" || this.formTarget.style.display === "") {
      this.formTarget.style.display = "block"
    } else {
      this.formTarget.style.display = "none"
    }
  }
}
