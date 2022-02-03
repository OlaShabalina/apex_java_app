import { LightningElement } from 'lwc';

export default class DatePicker extends LightningElement {

  handleClick(event) {

    // generate a custom even to pass to the parent including date of checkin
    const customEvent = new CustomEvent('dateselected', {
      detail: event.target.value
    })
    // Fire the event from datePicker
    this.dispatchEvent(customEvent);
  }
}