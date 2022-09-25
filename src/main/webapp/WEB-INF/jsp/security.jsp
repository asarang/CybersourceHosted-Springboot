<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="javax.xml.bind.DatatypeConverter" %>
<%@ page import="javax.crypto.Mac" %>
<%@ page import="javax.crypto.spec.SecretKeySpec" %>
<%@ page import="java.security.InvalidKeyException" %>
<%@ page import="java.security.NoSuchAlgorithmException" %>
<%@ page import="java.io.UnsupportedEncodingException" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>

<%! private static final String HMAC_SHA256 = "HmacSHA256";
    private static final String SECRET_KEY = "cfda1c8555c54794801fbc65298ccb1a7c1a5e5080af46c2964e805d0a9f538fc1811b9999eb418287e4d773b5c70d806c25dc20f97441e4a74e1001f42dbe1d6593e668c6374dba801c417ba1bc5370cf242268efab45d6a1852d1dd8357fd2a6a44678019246c2a3bc2d51dc16797a6fcc7719ec6d4075a023fe08ad221a36";

    private String sign(HashMap params) throws InvalidKeyException, NoSuchAlgorithmException, UnsupportedEncodingException {
        return sign(buildDataToSign(params), SECRET_KEY);
    }

    private String sign(String data, String secretKey) throws InvalidKeyException, NoSuchAlgorithmException, UnsupportedEncodingException {
        SecretKeySpec secretKeySpec = new SecretKeySpec(secretKey.getBytes(), HMAC_SHA256);
        Mac mac = Mac.getInstance(HMAC_SHA256);
        mac.init(secretKeySpec);
        byte[] rawHmac = mac.doFinal(data.getBytes("UTF-8"));
        return DatatypeConverter.printBase64Binary(rawHmac).replace("\n", "");
    }

    private String buildDataToSign(HashMap params) {
        String[] signedFieldNames = String.valueOf(params.get("signed_field_names")).split(",");
        ArrayList<String> dataToSign = new ArrayList<String>();
        for (String signedFieldName : signedFieldNames) {
            dataToSign.add(signedFieldName + "=" + String.valueOf(params.get(signedFieldName)));
        }
        return commaSeparate(dataToSign);
    }

    private String commaSeparate(ArrayList<String> dataToSign) {
        StringBuilder csv = new StringBuilder();
        for (Iterator<String> it = dataToSign.iterator(); it.hasNext(); ) {
            csv.append(it.next());
            if (it.hasNext()) {
                csv.append(",");
            }
        }
        return csv.toString();
    }
%>
