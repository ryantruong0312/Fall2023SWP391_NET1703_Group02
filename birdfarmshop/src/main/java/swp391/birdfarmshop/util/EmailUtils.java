/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package swp391.birdfarmshop.util;

/**
 *
 * @author Admin
 */
public class EmailUtils {

    public static String sendActive(String name, String token) {
        String message = "<html>\n"
                + "    <body>\n"
                + "        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse:collapse;border:0;max-width:600px;background:#f8f9fa; margin: auto; margin-top: 40px\"width=\"100%\">\n"
                + "            <tbody>\n"
                + "                <tr>\n"
                + "                    <td style=\"text-align:center;border-bottom-color:orange;border-bottom-style:solid;border-bottom-width:10px;border-top-width:0; padding-top: 15px; padding-bottom: 10px;\">\n"
                + "                        <h3>V.E.T</h3>    \n"
                + "                    </td>\n"
                + "                </tr>\n"
                + "                <tr style=\"padding-top: 10px\">\n"
                + "                    <td style=\"padding-top: 30px;padding-left: 20px; font-weight: bold;\">\n"
                + "                        Xin chào " + name + ",  \n"
                + "                    </td>\n"
                + "                </tr>\n"
                + "                <tr style=\"padding-top: 10px\">\n"
                + "                    <td style=\"padding-top: 30px; padding-right: 40px ;padding-left: 20px;\">\n"
                + "                        Chào mừng bạn đã đến cửa hàng bán vẹt của chúng tôi để sử dụng tài khoản vui lòng bấm núi bên dưới để kích hoạt tài khoản:\n"
                + "                    </td>\n"
                + "                </tr>\n"
                + "                <tr style=\"padding-top: 10px; \">\n"
                + "                    <td style=\"padding-top: 50px; padding-right: 40px ;padding-left: 20px; text-align: center; padding-bottom: 20px\">\n"
                + "                        <a href=\"" + Constants.HOST + "MainController?action=active&token=" + token + "\"><button style=\"background-color: orange; border:none; line-height: 40px; color: white; font-weight: bold; padding: 0 10px; cursor: pointer;\">Kích hoạt tài khoản</button></a>\n"
                + "                    </td>\n"
                + "                </tr>\n"
                + "                <tr style=\"padding-top: 10px;\">\n"
                + "                    <td style=\"padding-top: 30px; padding-right: 40px ;padding-left: 20px; padding-bottom: 40px\">\n"
                + "                        Cảm ơn bạn đến với của hàng,\n"
                + "                        <br>\n"
                + "                        V.E.T\n"
                + "                    </td>\n"
                + "                </tr>\n"
                + "            </tbody>\n"
                + "        </table>\n"
                + "    </body>\n"
                + "</html>\n";
        return message;
    }

    public static String sendPassword(String name, String password) {
        String message = "<html>\n"
                + "    <body>\n"
                + "        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse:collapse;border:0;max-width:600px;background:#f8f9fa; margin: auto; margin-top: 40px\"width=\"100%\">\n"
                + "            <tbody>\n"
                + "                <tr>\n"
                + "                    <td style=\"text-align:center;border-bottom-color:orange;border-bottom-style:solid;border-bottom-width:10px;border-top-width:0; padding-top: 15px; padding-bottom: 10px;\">\n"
                + "                        <h3>V.E.T</h3>    \n"
                + "                    </td>\n"
                + "                </tr>\n"
                + "                <tr style=\"padding-top: 10px\">\n"
                + "                    <td style=\"padding-top: 30px;padding-left: 20px; font-weight: bold;\">\n"
                + "                        Xin chào " + name + ",  \n"
                + "                    </td>\n"
                + "                </tr>\n"
                + "                <tr style=\"padding-top: 10px\">\n"
                + "                    <td style=\"padding-top: 30px; padding-right: 40px ;padding-left: 20px;\">\n"
                + "                        Chúng tôi đã cấp lại mật khẩu cho bạn, hãy sử dụng số dưới đây để đăng nhập:\n"
                + "                    </td>\n"
                + "                </tr>\n"
                + "                <tr style=\"padding-top: 10px; \">\n"
                + "                    <td style=\"padding-top: 50px; padding-right: 40px ;padding-left: 20px; text-align: center; padding-bottom: 20px\">\n"
                + "                       <button style=\"background-color: orange; border:none; line-height: 40px; color: white; font-weight: bold; padding: 0 10px; cursor: pointer;\">"+password+"</button>\n"
                + "                    </td>\n"
                + "                </tr>\n"
                + "                <tr style=\"padding-top: 10px;\">\n"
                + "                    <td style=\"padding-top: 30px; padding-right: 40px ;padding-left: 20px; padding-bottom: 40px\">\n"
                + "                        Cảm ơn bạn đến với của hàng,\n"
                + "                        <br>\n"
                + "                        V.E.T\n"
                + "                    </td>\n"
                + "                </tr>\n"
                + "            </tbody>\n"
                + "        </table>\n"
                + "    </body>\n"
                + "</html>\n";
        return message;
    }
}