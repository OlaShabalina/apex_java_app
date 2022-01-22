public with sharing class DropdownContactsController {
    
    // Return Contact Id as key and Contact Name as value to be displayed in a Dropdown list on Visualforce page
    public List<SelectOption> getRecords() {
        List<SelectOption> options = new List<SelectOption>();
        List<Contact> contacts = [select Id, Name from Contact];
        for(Contact objContact : contacts){
            options.add(new SelectOption(objContact.Id, objContact.Name));
        }
        return options;
    }
    
}
