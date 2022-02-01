import { LightningElement, wire } from 'lwc';
import FIRS_NAME_FIELD from '@salesforce/schema/Contact.FirstName';
import LAST_NAME_FIELD from '@salesforce/schema/Contact.LastName';
import CHECKIN_DATE_FIELD from '@salesforce/schema/Contact.Date_of_checkin__c';
import getContacts from '@salesforce/apex/ContactsListWithController.getContacts';

const COLUMNS = [
  { label: 'First Name', fieldName: FIRS_NAME_FIELD.fieldApiName, type: 'text' },
  { label: 'Last Name', fieldName: LAST_NAME_FIELD.fieldApiName, type: 'text' },
  { label: 'Email', fieldName: CHECKIN_DATE_FIELD.fieldApiName, type: 'text' }
];

export default class CheckedInUsers extends LightningElement {
  columns = COLUMNS;
  @wire(getContacts)
  contacts;
}