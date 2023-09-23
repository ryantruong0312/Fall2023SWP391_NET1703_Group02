/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package swp391.birdfarmshop.util;

public class Constants {

    public static String GOOGLE_CLIENT_ID = "911997830678-hnnf8alt3ehncr0mdo75f4kc2ckkdm6q.apps.googleusercontent.com";
    public static String GOOGLE_CLIENT_SECRET = "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";
    public static String GOOGLE_REDIRECT_URI = "http://localhost:8080/birdfarmshop/LoginGoogleController";
    public static String GOOGLE_LINK_GET_TOKEN = "https://accounts.google.com/o/oauth2/token";
    public static String GOOGLE_LINK_GET_USER_INFO = "https://www.googleapis.com/oauth2/v1/userinfo?access_token=";
    public static String GOOGLE_GRANT_TYPE = "authorization_code";

    public static String FACEBOOK_APP_ID = "334333278988069";
    public static String FACEBOOK_APP_SECRET = "5db2f58049271630d5afd5038a3821d6";
    public static String FACEBOOK_REDIRECT_URL = "https://localhost:8080/birdfarmshop/LoginFacebookController";
    public static String FACEBOOK_LINK_GET_TOKEN = "https://graph.facebook.com/oauth/access_token?client_id=%s&client_secret=%s&redirect_uri=%s&code=%s";

    public static String JWT_KEY = "birdfarmshop-swp-fptuniversity-token-base-authentication";
}
