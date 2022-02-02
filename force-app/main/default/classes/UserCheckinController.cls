public with sharing class UserCheckinController {
    
    // wrapper class with @AuraEnabled and {get;set;} properties 
    public class CheckedInUserVariablesWrapper {

        // declaring values from the input
        @AuraEnabled
        public String firstName{get;set;}
        @AuraEnabled
        public String lastName{get;set;}
        @AuraEnabled
        public Date checkinDate{get;set;}

        // declaring error and success messages
        @AuraEnabled
        public String firstnameError{get;set;}
        @AuraEnabled
        public String lastNameError{get;set;}
        @AuraEnabled
        public String dateError{get;set;}
        @AuraEnabled
        public String successMessage{get;set;}
    }

    @AuraEnabled(cacheable=true)
    public static void saveForm() {

        CheckedInUserVariablesWrapper usersWrapper = new CheckedInUserVariablesWrapper();

        boolean isInputValid = true;

        // any letter (regardless of case) or digit will match, no special characters included
        String reg = '^[A-Za-z0-9]*$';
        Pattern mypattern = Pattern.compile(reg);

        // Match With First Name
        Matcher firstNameMatcher = mypattern.matcher(usersWrapper.firstName);
        boolean isFirstNameValid = firstNameMatcher.matches();

        // Match With Last Name
        Matcher lastNameMatcher = mypattern.matcher(usersWrapper.lastName);
        boolean isLastNameValid = lastNameMatcher.matches();
        
        // Checkin Date difference - if less than 0 then it will be past date
        Date startDate = Date.today();
        Integer noOfDays = startDate.daysBetween( usersWrapper.checkinDate );
        
        // validation for each field with displaying an error message
        if ( isFirstNameValid == false ) {
            isInputValid = false;
            usersWrapper.firstnameError = 'Please Enter Valid First Name';
        } else {
            usersWrapper.firstnameError = '';
        }

        if ( isLastNameValid == false ) {
            isInputValid = false;
            usersWrapper.lastNameError = 'Please Enter Valid Last Name';
        } else {
            usersWrapper.lastNameError = '';
        } 
        
        if ( noOfDays < 0 ) {
            isInputValid = false;
            usersWrapper.dateError = 'Please Enter today or Up Comming Date';
        } else {
            usersWrapper.dateError = '';
        } 
        
        // if everything is valid we submit the form
        if ( isInputValid == true) {

            // if everything is correct we create a new contact with checkin date
            Contact newContact = new Contact();
            newContact.FirstName = usersWrapper.firstName;
            newContact.LastName = usersWrapper.lastName;
            newContact.Date_of_checkin__c = usersWrapper.checkinDate;
            
            insert newContact;

            usersWrapper.SuccessMessage = 'You have successfully checked in';
        }
       
    }
}