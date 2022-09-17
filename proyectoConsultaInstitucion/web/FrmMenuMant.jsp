

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            function mantcarrera(){
                document.form.action="<%=request.getContextPath()%>/InstitucionServlet";
                document.form.method="GET";
                document.form.op.value="1";
                document.form.submit();
            }
        </script>
    </head>
    <body>
    <center>
        <form name="form">
            <input type="hidden" name="op">
            <table>
                <tr>
                    <td>
                        <button onclick="mantcarrera()">Buscar Institucion</button>
                    </td>
                    
                     <td>
                        <button onclick="mantcarrera()">xxxx</button>
                    </td>
                     
                </tr>
            </table>
        </form>        
    </center>
    </body>
</html>