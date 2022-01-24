public with sharing class ExtenOnUserCheckin {
    
    private ApexPages.StandardController sc;
    public ExtenOnUserCheckin(ApexPages.StandardController sc) {
        this.sc = sc;
    }
    
    public Boolean displaySuccessMessage {get; set;}     
    
    public void closeSuccessMessage() {  
        displaySuccessMessage = false;
        
    }     
    public void showSuccessMessage() {
        sc.Save();        
        displaySuccessMessage = true;
    }
    
   public PageReference Redirect() {
      	
    // redirecting to the page with a list of users
    PageReference userListPage = new PageReference('https://resourceful-hawk-2mn035-dev-ed--c.visualforce.com/apex/ListOfCheckedInUsers');
    return userListPage;

    }
}
