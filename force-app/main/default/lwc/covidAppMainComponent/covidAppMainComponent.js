import { LightningElement } from 'lwc';


export default class CovidAppMainComponent extends LightningElement {
  childAction;

  handleFormSubmit() {
    window.location.reload();
  }
}