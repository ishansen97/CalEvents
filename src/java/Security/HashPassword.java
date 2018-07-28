package Security;

import java.security.MessageDigest;

public class HashPassword {

    public String generatePassword(String password) throws Exception {
        
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        md.update(password.getBytes());

        byte byteData[] = md.digest();

        //convert the byte to hex format
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < byteData.length; i++) {
            sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
        }

        String newPassword = sb.toString();

        return newPassword;

    }
}
