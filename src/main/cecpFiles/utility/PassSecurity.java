package utility;

import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;
import java.math.BigInteger;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.security.spec.InvalidKeySpecException;

public class PassSecurity {

    private final String ALGORITHM = "PBKDF2WithHmacSHA1";
    private final int KEY_LENGTH = (64*8);
    private final int ITERATIONS = 65457;

    public byte [] getSalt() throws NoSuchAlgorithmException{

        SecureRandom secRand = SecureRandom.getInstance("SHA1PRNG");
        byte [] salt = new byte[16];
        secRand.nextBytes(salt);
        return salt;

    }

    public String generatePasswordHash(String password) throws NoSuchAlgorithmException, InvalidKeySpecException {

        char [] passwordCharacters = password.toCharArray();
        byte [] salt = getSalt();
        PBEKeySpec spec = new PBEKeySpec(passwordCharacters, salt, ITERATIONS, KEY_LENGTH);
        SecretKeyFactory skf = SecretKeyFactory.getInstance(ALGORITHM);
        byte [] hashedPassword = skf.generateSecret(spec).getEncoded();
        return toHex(salt) + ":" + toHex(hashedPassword) + ":" + ITERATIONS;

    }

    public String toHex(byte [] inputArray) {

        BigInteger bigInteger = new BigInteger(1, inputArray);
        return bigInteger.toString(16);

    }

    public byte [] toByteArray(String hexString) {

        byte [] byteArray = new BigInteger(hexString, 16).toByteArray();
        if (byteArray[0] == 0) {
            byte [] output = new byte[byteArray.length - 1];
            System.arraycopy(byteArray, 1, output, 0, output.length);
            return output;
        }
        return byteArray;

    }
}
