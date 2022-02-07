import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import saveForm from '@salesforce/apex/UserCheckinController.saveForm';

export default class UserCheckinForm extends LightningElement {
    // declare variables
    firstName;
    lastName;
    checkinDate;


    // initialising input
    setFirstName(event) {
        this.firstName = event.target.value;
    }

    setLastName(event) {
        this.lastName = event.target.value;
    }

    setCheckinDate(event) {
        this.checkinDate = event.target.value;
    }

    // on success , we will send a toast message and pass a custom event to the parent
    handleSubmit(event) {
        saveForm({firstName: this.firstName, lastName:this.lastName, checkinDate: this.checkinDate})
        .then(result =>{

            console.log(result)

            const resultinJSON = JSON.parse(result); 

            let title = '';

            if (resultinJSON.firstnameError) {
                title = resultinJSON.firstnameError;
            }

        //     private String firstnameError;
        // private String lastNameError;
        // private String dateError;
        // private String successMessage;

            const updateUsersListEvent = new CustomEvent('somethingelse');
            this.dispatchEvent(updateUsersListEvent);
    
            // show success or error message on form submission
            const toastEvent = new ShowToastEvent({
                title: title,
                message: "You can find your name in the list of checked-in users",
                variant: "success"
            }); 
            
            this.dispatchEvent(toastEvent);
        })
        .catch(error =>{
            console.log(error);
            alert(error);
        })


       

    }
    
}