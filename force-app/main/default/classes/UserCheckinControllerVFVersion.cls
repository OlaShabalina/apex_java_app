public with sharing class UserCheckinControllerVFVersion {

    // taking variables from the input using get/set
    public String firstName{get;set;}
    public String lastName{get;set;}
    public Date checkinDate{get;set;}

    // setting variables for error and success messages
    public String firstnameError{get;set;}
    public String lastNameError{get;set;}
    public String dateError{get;set;}
    public String successMessage{get;set;}

    // method for creating new contact and validating the inputs
    public void saveForm() {

        boolean isInputValid = true;
        
        // any letter (regardless of case) or digit will match, no special characters included
        String reg = '^[A-Za-z0-9]*$';
        Pattern mypattern = Pattern.compile(reg);

        // Match With First Name
        Matcher firstNameMatcher = mypattern.matcher(firstName);
        boolean isFirstNameValid = firstNameMatcher.matches();

        // Match With Last Name
        Matcher lastNameMatcher = mypattern.matcher(lastName);
        boolean isLastNameValid = lastNameMatcher.matches();
        
        // Checkin Date difference - if less than 0 then it will be past date
        Date startDate = Date.today();
        Integer noOfDays = startDate.daysBetween(checkinDate);
        
        // validation for each field with displaying an error message

        if ( isFirstNameValid == false ) {
            isInputValid = false;
            firstnameError = 'Please Enter Valid First Name';
        } else {
            firstnameError = '';
        }

        if ( isLastNameValid == false ) {
            isInputValid = false;
            lastNameError = 'Please enter a valid last name';
        } else {
            lastNameError = '';
        } 
        
        if ( noOfDays < 0 ) {
            isInputValid = false;
            dateError = 'Please enter today or future date';
        } else {
            dateError = '';
        }
        
        // if everything is valid we submit the form by adding new contact with checked-in date
        if ( isInputValid == true) {

                Contact newCheckedImContact = new Contact();
                newCheckedImContact.FirstName = firstName;
                newCheckedImContact.LastName = lastName;
                newCheckedImContact.Date_of_checkin__c = checkinDate;

                insert newCheckedImContact;

                successMessage = 'You have successfully checked in';
        }
        
    }
}