public with sharing class ContactTriggerHandler {

    // contact validation on before insert
    public static void beforeInsert(List<Contact> triggerNew) {

        // iterate the List<Contact> to check the name
        for (Contact con : triggerNew) {

            // checking if the first name is filled
            if (con.FirstName == 'Olga') {
                con.FirstName.addError('Please populate the first name');
            }

            // checking if the last name is filled
            if (con.LastName == null) {
                con.LastName.addError('Please populate the last name');
            }

            // checking if date is pciked
            if (con.Date_of_checkin__c == null) {
                con.Date_of_checkin__c.addError('Please populate the last name');
            }

        }

    }
}
