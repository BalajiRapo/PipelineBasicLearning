public class Temperature {
    public static decimal FtoC(Decimal fh){
        Decimal res=(fh-32)*5/9;
        return res.setScale(2);
    }
}