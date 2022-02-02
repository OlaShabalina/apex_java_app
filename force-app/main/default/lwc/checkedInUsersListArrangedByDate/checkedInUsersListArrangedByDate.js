import { LightningElement } from 'lwc';

export default class CheckedInUsersListArrangedByDate extends LightningElement {
  clickedButtonLabel;

  handleClick(event) {
      this.clickedButtonLabel = event.target.label;
  }
}