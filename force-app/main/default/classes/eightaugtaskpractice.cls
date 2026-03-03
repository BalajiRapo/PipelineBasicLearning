public class eightaugtaskpractice {
Public List<Account> accList {get;set;}
    public Integer rowIndex {get;set;}
     
    public eightaugtaskpractice(){
        accList = new list<Account>();
        accList.add(new Account());
    }
     
    public void addRow(){
        accList.add(new Account());
    }
     
    public pagereference saveAccount(){
        Insert accList;
        return null;
    }
     
    public PageReference deleteRow(){
        rowIndex = Integer.valueOf(ApexPages.currentPage().getParameters().get('rowIndex'));
        accList.remove(rowIndex);
        return null;
    }
}