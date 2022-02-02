import { LightningElement, wire } from 'lwc';
import ID_FIELD from '@salesforce/schema/Contact.Id';
import FIRS_NAME_FIELD from '@salesforce/schema/Contact.FirstName';
import LAST_NAME_FIELD from '@salesforce/schema/Contact.LastName';
import CHECKIN_DATE_FIELD from '@salesforce/schema/Contact.Date_of_checkin__c';
import getContacts from '@salesforce/apex/ContactsListWithController.getContacts';
import { refreshApex } from '@salesforce/apex';

const COLUMNS = [
  { label: 'First Name', fieldName: FIRS_NAME_FIELD.fieldApiName, type: 'text' },
  { label: 'Last Name', fieldName: LAST_NAME_FIELD.fieldApiName, type: 'text' },
  { label: 'Checkin Date', fieldName: CHECKIN_DATE_FIELD.fieldApiName, type: 'text' },
  { label: 'Id', fieldName: ID_FIELD.fieldApiName, type: 'text' }
];

export default class CheckedInUsersList extends LightningElement {
  columns = COLUMNS;

  // requesting contact list from the backend using apex class
  @wire(getContacts)
  contacts;
  
  // refreshing the data in the table
  handleListRefresh (){
    refreshApex(this.contacts);
  }

  handleRowAction(event) {
    
// event for showing the contact details
// or delete the record, yet to decide
    
  }

}