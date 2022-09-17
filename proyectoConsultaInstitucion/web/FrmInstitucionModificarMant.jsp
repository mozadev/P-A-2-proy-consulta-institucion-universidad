

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="BEAN.InstitucionBean"%>
<%!
    InstitucionBean objCarreraBean=null;
%>
<%
    objCarreraBean =(InstitucionBean)request.getAttribute("datos");
%>

<!DOCTYPE html>
<html>
    <head>
        <title>JSP Page</title>
        <script>
         
        function salir(){
            document.form.action="<%=request.getContextPath()%>/CarreraServlet";
            document.form.method="GET";
            document.form.op.value="5";
            document.form.submit();
        }
        function modificar(){
            document.form.action="<%=request.getContextPath()%>/CarreraServlet";
            document.form.method="GET";
            document.form.op.value="7";
            document.form.submit();
        }
        </script>
    </head>
    <body>
        <form name="form">
            <input type="hidden" name="op">
            <input type="hidden" name="CODIGO" VALUE="<%=objCarreraBean.getCODINSTI()%>">
            
            <center>
                <table>
                    <tr>
                        <td colspan="2">Modificar Tabla Carrera</td>
                    </tr>
                    <tr>
                        <td>Codigo: </td>
                        <td><input type="text" disabled="false" name="txtcodigo" value="<%=objCarreraBean.getCODINSTI()%>"></td>
                    </tr>
                    <tr>
                        <td>Nombre: </td>
                        <td><input type="text" name="txtnombre" value="<%=objCarreraBean.getNOMBINSTI()%>"></td>
                    </tr>
                    
                     <tr>
                        <td>Estado: </td>
                        <td><input type="text" name="txtestado" value="<%=objCarreraBean.getESTADOCARRERA()%>"></td>
                    </tr>
                </table>
                    <table border="1">
                        <tr>
                            <td><button onclick="modificar()">Modifciar</button></td>
                            <td><button onclick="salir()">Salir</button></td>
                        </tr>
                    </table>
                    <font style="color: red">
                    <% 
                        if(request.getAttribute("mensaje")!=null){
                        String msj=(String)request.getAttribute("mensaje");
                        out.print(msj);
                    }
                    %>
                    </font>
            </center>
        </form>
    </body>
</html>
