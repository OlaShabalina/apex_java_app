public with sharing class ExtenOnUserCheckin {
    
    // declaring values from the input
    public String FirstName{get;set;}
    public String LastName{get;set;}
    public Date CheckinDate{get;set;}

    // declaring error and success messages
    public String FirstnameError{get;set;}
    public String LastNameError{get;set;}
    public String DateError{get;set;}
    public String SuccessMessage{get;set;}

    Public ExtenOnUserCheckin(ApexPages.StandardController controller) {
            //id = System.currentPageReference().getParameters().get('id');
    }

    public void saveForm() {

        boolean isInputValid = true;

        // any letter (regardless of case) or digit will match, no special characters included
        String reg = '^[A-Za-z0-9]*$';
        Pattern mypattern = Pattern.compile(reg);

        // Match With First Name
        Matcher FirstMatcher = mypattern.matcher(FirstName);
        boolean isFirstNameValid = FirstMatcher.matches();

        // Match With Last Name
        Matcher LastMyMatcher = mypattern.matcher(LastName);
        boolean isLastNameValid = LastMyMatcher.matches();
        
        // Checkin Date difference - if less than 0 then it will be past date
        Date startDate = Date.today();
        Integer noOfDays = startDate.daysBetween( CheckinDate );
        
        // validation for each field with displaying an error message
        if ( isFirstNameValid == false ) {
            isInputValid = false;
            FirstnameError = 'Please Enter Valid First Name';
        } else {
            FirstnameError = '';
        }

        if ( isLastNameValid == false ) {
            isInputValid = false;
            LastNameError = 'Please Enter Valid Last Name';
        } else {
            LastNameError = '';
        } 
        
        if ( noOfDays < 0 ) {
            isInputValid = false;
            DateError = 'Please Enter today or Up Comming Date';
        } else {
            DateError = '';
        } 
        
        if ( isInputValid == true) {

            // if everything is correct we create a new contact with checkin date
            Contact newContact = new Contact();
            newContact.FirstName = FirstName;
            newContact.LastName = LastName;
            newContact.Date_of_checkin__c = CheckinDate;
            
            insert newContact;

            SuccessMessage = 'You have successfully checked in';
        }
       
    }
}