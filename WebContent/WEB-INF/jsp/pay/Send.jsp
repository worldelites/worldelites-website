<%@page import="util.Constants"%>
<%@page import="org.springframework.ui.Model"%>
<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<jsp:useBean id="MD5" scope="request" class="beartool.MD5"/>
<%
//��ʼ���������
String v_mid,key,v_url,v_oid,v_amount,v_moneytype,v_md5info;  //������봫�ݵ�eile��������

	v_mid = Constants.PAY_ID;			   // �̻��ţ�����Ϊ�����̻���20000400���滻Ϊ�Լ����̻��ż���
	v_url =  request.getAttribute("url").toString();    	 // �̻��Զ��巵�ؽ���֧�������ҳ��
													      		// MD5��ԿҪ�������ύҳ��ͬ����Send.asp��� key = "test" ,�޸�""���� test Ϊ������Կ
	  key = Constants.PAY_KEY;			// �������û������MD5��Կ���½����Ϊ���ṩ�̻���̨����ַ��https://merchant3.chinabank.com.cn/
													      		// ��½��������ĵ�����������ҵ������Ϲ������������Ϲ����Ķ������������С�MD5��Կ���á� 
													     	   // ����������һ��16λ���ϵ���Կ����ߣ���Կ���64λ��������16λ�Ѿ��㹻��
//****************************************


		//����������Ҫ�̻��޸�
		
    v_oid=request.getAttribute("v_oid").toString();
	  if(v_oid!=null && !v_oid.equals(""))  //�ж��Ƿ��д��ݶ�����
	  {
	  }
		else                         
	  {
		  Date currTime = new Date();
		  SimpleDateFormat sf = new SimpleDateFormat("yyyyMMdd-"+v_mid+"-hhmmss",Locale.US);
		  v_oid=sf.format(currTime);                        // �Ƽ������Ź��ɸ�ʽΪ ������-�̻���-Сʱ������
	  }                                  
		v_amount=request.getAttribute("v_amount").toString();				// �������                   
		v_moneytype ="CNY";	                  				// ����
		v_md5info = "";										// ��ƴ�մ�MD5˽Կ���ܺ��ֵ

String text = v_amount+v_moneytype+v_oid+v_mid+v_url+key;   // ƴ�ռ��ܴ�
v_md5info = MD5.getMD5ofStr(text);                          // ����֧��ƽ̨��MD5ֵֻ�ϴ�д�ַ���������Сд��MD5ֵ��ת��Ϊ��д

//************���¼���������֧�������޹أ����鲻��**************
String v_rcvname,v_rcvaddr,v_rcvtel,v_rcvpost,v_rcvemail,v_rcvmobile;  //����Ǳ������
       
	  v_rcvname = "WE";     // �ջ���
	  v_rcvaddr = "http://www.worldelites.com/";     // �ջ���ַ
	   v_rcvtel = "+1 (510) 761-8000";      // �ջ��˵绰
	  v_rcvpost = request.getParameter("v_rcvpost");     // �ջ����ʱ�
	 v_rcvemail ="";   // �ջ����ʼ�
	v_rcvmobile = request.getParameter("v_rcvmobile");   // �ջ����ֻ���

String v_ordername,v_orderaddr,v_ordertel,v_orderpost,v_orderemail,v_ordermobile;

	v_ordername = request.getParameter("v_ordername");   // ����������
	v_orderaddr = request.getParameter("v_orderaddr");   // �����˵�ַ
	 v_ordertel = request.getParameter("v_ordertel");    // �����˵绰
	v_orderpost = request.getParameter("v_orderpost");   // �������ʱ�
   v_orderemail = request.getAttribute("email").toString();  // �������ʼ�
  v_ordermobile = request.getParameter("v_ordermobile"); // �������ֻ���

String remark1,remark2;

		remark1 = request.getParameter("remark1");               //��ע�ֶ�1
		remark2 = request.getParameter("remark2");               //��ע�ֶ�2


%>

<!--������ϢΪ��׼�� HTML ��ʽ + JAVA ���� ƴ�ն��ɵ� �������� ֧���ӿڱ�׼��ʾҳ�� -->

<html>

<body onLoad="javascript:document.E_FORM.submit()">
<form action="https://pay3.chinabank.com.cn/PayGate" method="POST" name="E_FORM">

  <!--���¼���Ϊ����֧����Ҫ��Ϣ����Ϣ������ȷ������Ϣ��Ӱ��֧�����У�-->
    
  <input type="hidden" name="v_md5info"    value="<%=v_md5info%>" size="100">
  <input type="hidden" name="v_mid"        value="<%=v_mid%>">
  <input type="hidden" name="v_oid"        value="<%=v_oid%>">
  <input type="hidden" name="v_amount"     value="<%=v_amount%>">
  <input type="hidden" name="v_moneytype"  value="<%=v_moneytype%>">
  <input type="hidden" name="v_url"        value="<%=v_url%>">

    
  <!--���¼�����Ϊ����֧����ɺ���֧��������Ϣһͬ������Ϣ����ҳ���ڴ�����������ݲ���ı�,�磺Receive.asp -->
    
  <input type="hidden"  name="remark1" value="<%=remark1%>">
  <input type="hidden"  name="remark2" value="<%=remark2%>">
    
  <!--���¼���������֧�������޹أ�ֻ��������¼�ͻ���Ϣ�����Բ��ã�ʹ�úͲ�ʹ�ö���Ӱ��֧�� -->

	<input type="hidden"  name="v_rcvname"      value="<%=v_rcvname%>">
	<input type="hidden"  name="v_rcvaddr"      value="<%=v_rcvaddr%>">
	<input type="hidden"  name="v_rcvtel"       value="<%=v_rcvtel%>">
	<input type="hidden"  name="v_rcvpost"      value="<%=v_rcvpost%>">
	<input type="hidden"  name="v_rcvemail"     value="<%=v_rcvemail%>">
	<input type="hidden"  name="v_rcvmobile"    value="<%=v_rcvmobile%>">

	<input type="hidden"  name="v_ordername"    value="<%=v_ordername%>">
	<input type="hidden"  name="v_orderaddr"    value="<%=v_orderaddr%>">
	<input type="hidden"  name="v_ordertel"     value="<%=v_ordertel%>">
	<input type="hidden"  name="v_orderpost"    value="<%=v_orderpost%>">
	<input type="hidden"  name="v_orderemail"   value="<%=v_orderemail%>">
	<input type="hidden"  name="v_ordermobile"  value="<%=v_ordermobile%>">
  
  </form>

</body>
</html>