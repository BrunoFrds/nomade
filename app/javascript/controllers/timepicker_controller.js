import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"

// Connects to data-controller="timepicker"
export default class extends Controller {
  connect() {
    console.log("Test time");
    flatpickr(this.element, {
    enableTime: true,        // active la sélection d'heure
    noCalendar: true,        // pas de calendrier, juste l'heure
    dateFormat: "H:i",       // format envoyé à Rails (ex: 12:30)
    time_24hr: true,         // format 24h
    minuteIncrement: 30,     // intervalles de 30 minutes
    })
  }
}
