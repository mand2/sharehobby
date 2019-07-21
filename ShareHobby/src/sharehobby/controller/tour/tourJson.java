package sharehobby.controller.tour;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.URL;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.json.simple.JSONObject;

public class tourJson {

	

	public void tourDeatil(HttpServletRequest request, HttpServletResponse response, @RequestParam String contentId,
			@RequestParam String contentTypeId) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?ServiceKey=";
		String serviceKey = "%2BaXZ%2B71EvGvZgAqY9aGBaRswCeT6JCSmfbyw%2F3K0xubpjSDBJ85%2Fy%2Fdlysm4p8hB3ctvQnECLz875rIiHpVABw%3D%3D";
		String parameter = "";
		
		PrintWriter out = response.getWriter();
		
		// JSP에서 받아올 데이터
		parameter = parameter + "&" + "contentId=" + contentId;
		parameter = parameter + "&" + "contentTypeId=" + contentTypeId;
		parameter = parameter + "&" + "MobileOS=ETC";
		parameter = parameter + "&" + "MobileApp=tour";
		parameter = parameter + "&" + "_type=json";
		
		addr = addr + serviceKey + parameter;
		URL url = new URL(addr);
		
		System.out.println(addr);
		
		// URL로 부터 자바로 데이터 읽어오도록 URL 객체로 스트림 열기
		InputStream in = url.openStream();
		
		// InputStream의 데이터들을 바이트 배열로 저장하기 위해
		ByteArrayOutputStream bos1 = new ByteArrayOutputStream();
		
		// InputStream의 데이터를 바이트 배열로 복사
		IOUtils.copy(in, bos1);
		in.close();
		bos1.close();
		
		String mbos = bos1.toString("UTF-8");
		
		byte[] b = mbos.getBytes("UTF-8");
		String s = new String(b, "UTF-8");
		out.println(s);
		
		JSONObject json = new JSONObject();
		json.put("data", s);
		
	}
	
	private boolean redirect = false;
    

    public String process(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
         
        String jsonText = request.getParameter("jsonText");
         
        String name = null;
        String age = null;
         
        ArrayList<string> locationArray = new ArrayList<string>();
         
         
        try {
            JSONObject jo = new JSONObject(jsonText);
            name = jo.getString("이름");
            age = jo.getString("나이");
             
            JSONArray array = jo.getJSONArray("위치");
            for(int i=0; i < array.length(); i++){
                JSONObject jsonObject = array.getJSONObject(i);
                String lat = jsonObject.getString("위도");
                String lon = jsonObject.getString("경도");
                locationArray.add(i, "위도 : " + lat + ", 경도 : " + lon);
            }
             
        } catch (JSONException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
         
        request.setAttribute("name", name);
        request.setAttribute("age", age);
        request.setAttribute("locationArray", locationArray);
         
        return "/WEB-INF/jsonResult.jsp";
    }
 
    @Override
    public boolean isRedirect() {
        return redirect;
    }
	
	
}
