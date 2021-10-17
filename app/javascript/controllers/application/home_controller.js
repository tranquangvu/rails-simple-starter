import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  // eslint-disable-next-line class-methods-use-this
  connect() {
    // eslint-disable-next-line max-len
    console.log('Hello from ./app/javascript/controllers/application/home_controller.js');
  }
}
