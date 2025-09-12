import { Controller } from "@hotwired/stimulus"

// Connection au data-controller="reservation"
export default class extends Controller {
  // Variable pour suivre l'état d'affichage du second bloc
  connect() {
    this.shownValue = false // initialement caché
  }

  // Gestion du clic sur le bouton de validation
  handleClick(event) {
    const clientFields = document.querySelector(".client-info") // on cible le second bloc

    if (!this.shownValue) {
      // Premier clic : afficher le second bloc
      event.preventDefault() // on empêche la soumission
      clientFields.style.display = "block" // on affiche le second bloc
      this.shownValue = true // on met à jour l'état
    } else {
      // Deuxième clic : soumettre le formulaire
      clientFields.style.display = "none" // on cache le second bloc
      this.shownValue = false // on réinitialise l'état
    }
  }
}
