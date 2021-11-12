package units;

import java.util.regex.Pattern;

public  class FormatForm {
    public static final String EMAIL_REGEX = "^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,6}$" ;

    public FormatForm() {
    }

    public static boolean formatEmail(String email){
        return Pattern.compile(EMAIL_REGEX).matcher(email).matches();
    }
}
