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
      const html = `
        <div class="d-flex justify-content-center">
          <div class="text-center">
            <h2>00</h2><p class="m-0">days</p>
          </div>
          <h2 class="mx-2">:</h2>
          <div class="text-center">
            <h2>00</h2><p class="m-0">hours</p>
          </div>
          <h2 class="mx-2">:</h2>
          <div class="text-center">
            <h2>00</h2><p class="m-0">mins</p>
          </div>
          <h2 class="mx-2">:</h2>
          <div class="text-center">
            <h2>00</h2><p class="m-0">secs</p>
          </div>
        </div>`;
      this.element.innerHTML = html;
      return
    }

    // Time calculations for days, hours, minutes and seconds
    var days = Math.floor(distance / (1000 * 60 * 60 * 24));
    var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
    var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
    var seconds = Math.floor((distance % (1000 * 60)) / 1000);

    // Display the result in the element with id="demo"
    const html = `
      <div class="d-flex justify-content-center">
        <div class="text-center">
          <h2>${this.pad(days)}</h2><p class="m-0">days</p>
        </div>
        <h2 class="mx-2">:</h2>
        <div class="text-center">
          <h2>${this.pad(hours)}</h2><p class="m-0">hours</p>
        </div>
        <h2 class="mx-2">:</h2>
        <div class="text-center">
          <h2>${this.pad(minutes)}</h2><p class="m-0">mins</p>
        </div>
        <h2 class="mx-2">:</h2>
        <div class="text-center">
          <h2>${this.pad(seconds)}</h2><p class="m-0">secs</p>
        </div>
      </div>`;
    this.element.innerHTML = html;

    // If the count down is finished, write some text
    if (distance < 0) {
      clearInterval(x);
      this.element.innerHTML = "EXPIRED";
    }
  }

  pad(num) {
    num = num.toString();
    if (num < 10) num = "0" + num;
    return num;
  }
}
