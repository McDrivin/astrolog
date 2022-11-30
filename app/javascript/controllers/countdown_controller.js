import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="countdown"
export default class extends Controller {
  static values = {
    date: String
  }
  connect() {
    // Set the date we're counting down to
    this.countDownDate = new Date(this.dateValue).getTime();

    // Update the count down every 1 second
    setInterval(this.updateCountdown.bind(this), 1000);
  }

  updateCountdown() {
    // Get today's date and time
    var now = new Date().getTime();

    // Find the distance between now and the count down date
    var distance = this.countDownDate - now;

    if (distance <= 0) {
      this.element.innerHTML = '00 : 00 : 00 : 00';
      return
    }

    // Time calculations for days, hours, minutes and seconds
    var days = Math.floor(distance / (1000 * 60 * 60 * 24));
    var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
    var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
    var seconds = Math.floor((distance % (1000 * 60)) / 1000);

    // Display the result in the element with id="demo"
    this.element.innerHTML = days + "d " + hours + "h " + minutes + "m " + seconds + "s ";

    // If the count down is finished, write some text
    if (distance < 0) {
      clearInterval(x);
      this.element.innerHTML = "EXPIRED";
    }
  }
}
