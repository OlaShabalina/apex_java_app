import { LightningElement, wire, track } from 'lwc';
import FIRS_NAME_FIELD from '@salesforce/schema/Contact.FirstName';
import LAST_NAME_FIELD from '@salesforce/schema/Contact.LastName';
import CHECKIN_DATE_FIELD from '@salesforce/schema/Contact.Date_of_checkin__c';
import getContactsByCheckinDate from '@salesforce/apex/ContactsListWithController.getContactsByCheckinDate';

const COLUMNS = [
  { label: 'First Name', fieldName: FIRS_NAME_FIELD.fieldApiName, type: 'text' },
  { label: 'Last Name', fieldName: LAST_NAME_FIELD.fieldApiName, type: 'text' },
  { label: 'Checkin Date', fieldName: CHECKIN_DATE_FIELD.fieldApiName, type: 'text' }
];

export default class checkedInUsersListArrangedByDate extends LightningElement {
  columns = COLUMNS;

  // requesting contact list from the backend using apex class
  @wire(getContactsByCheckinDate, {checkinDate: '2022-02-04'})
  contacts;

}