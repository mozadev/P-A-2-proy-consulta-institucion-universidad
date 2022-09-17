
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="BEAN.InstitucionBean"%>
<%!ArrayList<InstitucionBean> listainstitucion; %>
<%listainstitucion=(ArrayList<InstitucionBean>)request.getAttribute("listainstitucion");%>
<!DOCTYPE html>
<html>
    <head>
        <title>JSP Page</title>
        <script>
           
      function grabar(){
            document.form.action="<%=request.getContextPath()%>/InstitucionServlet";
            document.form.method="GET";
            document.form.op.value="4";
            document.form.submit();
        }
            
        function salir(){
            document.form.action="<%=request.getContextPath()%>/InstitucionServlet";
            document.form.method="GET";
            document.form.op.value="2";
            document.form.submit();
        }
        function nuevo(){
            document.form.action="<%=request.getContextPath()%>/InstitucionServlet";
            document.form.method="GET";
            document.form.op.value="3";
            document.form.submit();
        }
        function modificar(cod,nomb,estado){
            document.form.action="<%=request.getContextPath()%>/InstitucionServlet";
            document.form.method="GET";
            document.form.op.value="6";
            document.form.COD.value=cod;
            document.form.NOM.value=nomb;
            document.form.ESTADO.value=estado;
            document.form.submit();
        }
        function eliminar(cod){
            document.form.action="<%=request.getContextPath()%>/InstitucionServlet";
            document.form.method="GET";
            document.form.op.value="8";
            document.form.COD.value=cod;
            document.form.submit();
        }
        
         function buscar(cod){
            document.form.action="<%=request.getContextPath()%>/InstitucionServlet";
            document.form.method="GET";
            document.form.op.value="9";
            document.form.BUSC.value=cod;
            document.form.submit();
        }
        
        </script>
    </head>
    
    <body>
    <center>
        <form name="form">
            <input type="hidden" name="op">
<!--            <input type="hidden" name="COD">
              <input type="hidden" name="NOM">
             <input type="hidden" name="ESTADO">-->
              <input type="hidden" name="BUSC">
           
                
                <center>
<!--                <table>
                    <tr>
                        <td colspan="2">Registrar Tabla Carrera</td>
                    </tr>
                    <tr>
                        <td>Codigo: </td>
                        <td><input type="text" name="txtcodigo"></td>
                    </tr>
                    <tr>
                        <td>Nombre: </td>
                        <td><input type="text" name="txtnombre"></td>
                    </tr>
                    
                    <tr>
                        <td>Estado: </td>
                        <td><input type="text" name="txtestado"></td>
                    </tr>
                </table>
                 <table border="1">
                    <tr>
                        <td><button onclick="grabar()">Grabar</button></td>
                        
                    </tr>               
                    
                </table>
                    
                    
                 <font style="color: red">
                    <%
                        if(request.getAttribute("mensaje")!=null){
                            String msj=(String)request.getAttribute("mensaje");
                            out.print(msj);
                        }
                    %>
                </font>-->
                
                 <table>
                    <tr>
                        <td colspan="2">Buscar Institucion</td>
                    </tr>
                    <tr>
                        <td>Institucion </td>
                        <td><input type="text" name="txtcodigo"></td>
                    </tr>
                    
                </table>
                
                <table border="1">
                    <tr>
                        <td><button  onclick="buscar()">Buscar</button></td>
                        
                    </tr>               
                    
                </table>
             
               
                  
                
               <table border="1">    
                   
                
                <tr>
                    <td>Codigo</td>
                    <td>Nombre</td>
                     <td>Siglas</td>
                     <td>Representante</td> 
                    <td>RUC</td>
                    <td>Tipo</td>
                    <td>Distrito</td>
                    <td>Provincia</td>
                    
                </tr>
                <% for(InstitucionBean obj:listainstitucion)
                {%>
                <tr>
                    <td><%=obj.getCODINSTI()%></td>
                    <td><%=obj.getNOMBINSTI()%></td>
                    <td><%=obj.getSIGLA()%></td>
                    <td><%=obj.getREPRESENTANTE()%></td>
                    <td><%=obj.getRUC()%></td>
                    <td><%=obj.getCODTIPO()%></td>
                    <td><%=obj.getCODDISTRI()%></td>
                    <td><%=obj.getCODPROVI()%></td>
<!--                    <td><button onclick="modificar('<%=obj.getCODINSTI()%>','<%=obj.getNOMBINSTI()%>','<%=obj.getSIGLA()%>')">Modificar</button></td>

                    <td><button onclick="eliminar('<%=obj.getCODINSTI()%>')">Eliminar</button></td>-->
                </tr>
                <%}%>
                 
            </table>
<!--                 <tr>
                 
                    <td colspan="1"></td>
                    <td><button onclick="salir()">Salir</button></td>
                </tr>-->
               
        </form>
    </center>
    </body>
</html>
