public with sharing class ContactsListWithController {
    
    // generating a list of checked in users from the Contacts, order them by date
    public List<Contact> getContacts() {
        
        List<Contact> results = Database.query(
            'SELECT FirstName, LastName, Id, Date_of_checkin__c ' +
            'FROM Contact ' +
            'WHERE Date_of_checkin__c != null ' +
            'ORDER BY Date_of_checkin__c'
        );

    return results;
    }
}
