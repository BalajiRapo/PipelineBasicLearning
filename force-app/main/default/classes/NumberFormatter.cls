public class NumberFormatter {

    public static String formatNumber(String input) {
        if (String.isEmpty(input)) return input;
        String formatted = input.replace(',', '|');
        formatted = formatted.replace('.', ',');
        formatted = formatted.replace('|', '.');
         return formatted;
    }

    public static String formatCurrency(String input) {
        if (String.isEmpty(input)) return input;
        String currencySign = input.substring(0, 1);
        String numberPart = input.substring(1).trim();
        String formattedNumber = formatNumber(numberPart);
        return currencySign + ' ' + formattedNumber + ' ' + currencySign;
    }

    public static void testFormatting() {
        System.debug(formatNumber('5,500.00'));       
         System.debug(formatCurrency('$1,234'));
    }
}