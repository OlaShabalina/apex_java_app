public with sharing class ExtenOnUserCheckin {
    
    private ApexPages.StandardController sc;
    public ExtenOnUserCheckin(ApexPages.StandardController sc) {
        this.sc = sc;
    }
    
    // Varible to display success message
    public Boolean displaySuccessMessage {get; set;} 
    
    public void closeSuccessMessage() {  
        displaySuccessMessage = false;
        
    }     
    public void showSuccessMessage() {
        try {
            sc.Save();        
            displaySuccessMessage = true;
        } catch (Exception error) {
            // display error message
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.WARNING,'Please enter Account phone'));
        }
    }
    
   public PageReference Redirect() {
      	
    // redirecting to the page with a list of users
    PageReference userListPage = new PageReference('https://resourceful-hawk-2mn035-dev-ed--c.visualforce.com/apex/ListOfCheckedInUsers');
    return userListPage;

    }
}
