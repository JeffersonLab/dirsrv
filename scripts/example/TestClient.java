import javax.naming.*;
import javax.naming.directory.*;
import java.util.*;

public class TestClient {
    public static void main(String[] args) throws NamingException {
        final String ldapServer = "ldap://localhost:7389";
        final String ldapUser = "cn=Directory Manager";
        final String ldapPass = "password";

        Hashtable<String, Object> env = new Hashtable<String, Object>();
        env.put("com.sun.jndi.ldap.trace.ber", System.err);
        env.put("com.sun.jndi.ldap.read.timeout", "10000");
        env.put("com.sun.jndi.ldap.connect.timeout", "10000");
        env.put(Context.SECURITY_AUTHENTICATION, "simple");
        env.put(Context.INITIAL_CONTEXT_FACTORY, "com.sun.jndi.ldap.LdapCtxFactory");
        env.put(Context.PROVIDER_URL, ldapServer);
        env.put(Context.SECURITY_PRINCIPAL, ldapUser);
        env.put(Context.SECURITY_CREDENTIALS, ldapPass);

        System.err.println("User: " + ldapUser);
        System.err.println("Pass: " + ldapPass);
        System.err.println("Server: " + ldapServer);


        DirContext ctx = new InitialDirContext(env);

        System.out.println("It Worked!");

        ctx.close();
    }
}