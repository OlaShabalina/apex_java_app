public with sharing class UserCheckinController {
    
    // wrapper class with @AuraEnabled and {get;set;} properties 
    private class CheckedInUserVariablesWrapper {

        // declaring values from the input
        private String firstName;
        private String lastName;
        private Date checkinDate;

    }

    
    private class errorSuccessMessagesWrapper {

        // declaring error and success messages
        private String firstnameError;
        private String lastNameError;
        private String dateError;
        private String successMessage;
    }

    @AuraEnabled(cacheable=true)
    public static String saveForm(String firstName, String lastName, Date checkinDate) {

        CheckedInUserVariablesWrapper usersWrapper = new CheckedInUserVariablesWrapper();
        errorSuccessMessagesWrapper errSuccsessWrapper = new errorSuccessMessagesWrapper();

        // default value for the wrapper to show success message if there are no errors
        errSuccsessWrapper.SuccessMessage = 'You have successfully checked in';

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
            errSuccsessWrapper.firstnameError = 'Please Enter Valid First Name';
            errSuccsessWrapper.SuccessMessage = '';
        } else {
            errSuccsessWrapper.firstnameError = '';
        }

        if ( isLastNameValid == false ) {
            isInputValid = false;
            errSuccsessWrapper.lastNameError = 'Please Enter Valid Last Name';
            errSuccsessWrapper.SuccessMessage = '';
        } else {
            errSuccsessWrapper.lastNameError = '';
        } 
        
        if ( noOfDays < 0 ) {
            isInputValid = false;
            errSuccsessWrapper.dateError = 'Please Enter today or Up Comming Date';
            errSuccsessWrapper.SuccessMessage = '';
        } else {
            errSuccsessWrapper.dateError = '';
        } 
        
        // if everything is valid we submit the form
        if ( isInputValid == true) {

            // if everything is correct we create a new contact with checkin date
            Contact newContact = new Contact();
            newContact.FirstName = usersWrapper.firstName;
            newContact.LastName = usersWrapper.lastName;
            newContact.Date_of_checkin__c = usersWrapper.checkinDate;
            
            insert newContact;
        }

        return JSON.serialize(errSuccsessWrapper);

    }
}