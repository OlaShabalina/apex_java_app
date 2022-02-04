import { LightningElement, api } from 'lwc';

export default class DatePicker extends LightningElement {
  @api contact;

  handleClick(event) {

    // generate a custom even to pass to the parent including date of checkin
    const customEvent = new CustomEvent('dateselected', {
      detail: this.contact.Date_of_checkin__c.value
    })
    // Fire the event from datePicker
    this.dispatchEvent(customEvent);
  }
}