import { LightningElement } from 'lwc';

export default class FilterAppMainComponent extends LightningElement {
  selectedCheckinDate;

  handleDateSelected(event) {
    this.selectedCheckinDate = event.detail;
  }
}