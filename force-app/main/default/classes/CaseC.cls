public class CaseC {
    public static void m() {
        List<Case> s = new List<Case>();
        
        for (Integer i = 0; i < 5000; i++) {
            Case c = new Case();
            c.Status = 'New'; 
            c.Origin = 'Phone'; // Ensure 'Origin' is the correct field name as per the Case object schema
            s.add(c);
        }

        try {
            Database.insert(s, false);
        } catch (Exception e) {
            System.debug('Error occurred: ' + e.getMessage());
        }
    }
}