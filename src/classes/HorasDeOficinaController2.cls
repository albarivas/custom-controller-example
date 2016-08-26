public with sharing class HorasDeOficinaController2 {
    
    private final Account account;

    public HorasDeOficinaController2() {
        account = [SELECT Id, Name, AccountNumber FROM Account][0];
    }

    public Account getAccount() {
        return account;
    }

    public PageReference save() {
        try
        {
            update account;
        }
        catch (Exception e)
        {
            ApexPages.addMessages(e);
        }
        return null;
    }
}