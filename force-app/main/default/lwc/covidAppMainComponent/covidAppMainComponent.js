import { LightningElement } from 'lwc';
import { getRecord, getFieldValue } from 'lightning/uiRecordApi';

export default class CovidAppMainComponent extends LightningElement {

  handleFormSubmit(event) {

    // custom event on the form submittion should 
    const listRefreshEvent = new CustomEvent('listrefresh');
    this.dispatchEvent(listRefreshEvent);
  }
}