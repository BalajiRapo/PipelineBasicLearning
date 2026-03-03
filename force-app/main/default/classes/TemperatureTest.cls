@isTest
public class TemperatureTest {
    @isTest
    private static void temp(){
        Decimal res=Temperature.FtoC(70);
        System.assertequals(21.11,res);
    }
}