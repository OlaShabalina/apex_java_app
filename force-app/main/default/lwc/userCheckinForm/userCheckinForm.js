import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

import CONTACT_OBJECT from '@salesforce/schema/Contact';
import FIRS_NAME_FIELD from '@salesforce/schema/Contact.FirstName';
import LAST_NAME_FIELD from '@salesforce/schema/Contact.LastName';
import CHECKIN_DATE_FIELD from '@salesforce/schema/Contact.Date_of_checkin__c';

export default class UserCheckinForm extends LightningElement {

    // fields to be displayed 
    objectApiName = CONTACT_OBJECT;
    fields = [FIRS_NAME_FIELD, LAST_NAME_FIELD, CHECKIN_DATE_FIELD];


    handleSuccess(event) {

        // show success message on form submission
        const toastEvent = new ShowToastEvent({
            title: "User has successfully checked in",
            message: event.detail.FirstName + " " + event.detail.LastName,
            variant: "success"
        });
        this.dispatchEvent(toastEvent);
    }
    
}