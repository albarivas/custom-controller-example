// Los controladores custom, al igual que otras clases Apex corren en modo sistema
// Si queremos que se respeten los settings de seguridad, hay que incluir el with sharing
public with sharing class HorasDeOficinaController {
   	
    public String accountName;
    private String accountNumber;
    private Account account;

    public HorasDeOficinaController() {
        account = [SELECT Id, Name, AccountNumber FROM Account][0];
        accountName = account.Name;
        accountNumber = account.AccountNumber;
    }

    public String getAccountName() {
        return accountName;
    }
    
    public void setAccountName(String name) {
        accountName = name;
    }
    
    public String getAccountNumber() {
        return accountNumber;
    }
    
    public void setAccountNumber(String num) {
        accountNumber = num;
    }

    public PageReference save() {
        try
        {
			account.Name = accountName;
            account.AccountNumber = accountNumber; 
        	update account;
        }
        catch (Exception e)
        {
            ApexPages.addMessages(e);
        }
        return null;
    }
}