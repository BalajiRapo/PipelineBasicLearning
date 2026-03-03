public class ops {
public static void CustomProductadd(){
Product2 pro=new Product2(name ='ProductName',IsActive=true);
insert pro;
PriceBook2 customprice=new PriceBook2(name='CustomPriceBook',IsActive=true);
insert customprice;
PriceBook2 standardPb=[select id from Pricebook2 where isStandard=true];
PriceBookEntry pbeStandard=new PriceBookEntry(Product2Id=pro.Id,PriceBook2Id=standardPb.Id,isActive=true,UnitPrice=1);
insert pbeStandard;
PricebookEntry pbe=new PriceBookEntry(Product2Id=pro.Id,PriceBook2Id=customprice.Id,isActive=true,UnitPrice=1);
insert pbe;
    system.debug('sd');
OpportunityLineItem lineitem=new OpportunityLineItem(OpportunityId='0065i000007Zj7xAAC',PriceBookEntryId=pbe.Id,Quantity=1,Unitprice=1);
insert lineitem;
    
}
}