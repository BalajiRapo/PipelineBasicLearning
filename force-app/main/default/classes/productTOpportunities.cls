public class productTOpportunities {
public List<product2> ListProduct{get; set;}
   
 
    
    public productTOpportunities(){
         Listproduct = new List<product2>();
    }
     public void addAccount(){
       Listproduct = new List<product2>();
        product2 acc= new product2();
        ListProduct.add(acc);
       }
     public void saveAccount(){  
      upsert ListProduct;           
    }
}