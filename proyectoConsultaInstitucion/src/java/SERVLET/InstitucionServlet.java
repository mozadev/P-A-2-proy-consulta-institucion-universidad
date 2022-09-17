
package SERVLET;

import BEAN.InstitucionBean;
import DAO.InstitucionDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class InstitucionServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String opcad=request.getParameter("op");
        int op = Integer.parseInt(opcad);
        switch(op){
            case 1:{
                InstitucionDAO objInstitucionDAO = new InstitucionDAO();
                ArrayList listainstitucion=objInstitucionDAO.ListarInstitucion();
                request.setAttribute("listainstitucion",listainstitucion);
                getServletContext().getRequestDispatcher("/FrmInstitucionMant.jsp").forward(request, response);
                break;
            }
            case 2:{
                getServletContext().getRequestDispatcher("/FrmInstitucionMant.jsp").forward(request, response);
                break;
            }
            case 3:{
                getServletContext().getRequestDispatcher("/FrmInstitucionRegistrarMant.jsp").forward(request, response);
                break;
            }
            
            case 9:{
                 String codcad=request.getParameter("txtcodigo");
               // int codigo = Integer.parseInt(codcad);

               // InstitucionBean objCarreraBean = new InstitucionBean();
                //objCarreraBean.setNOMBINSTI(codcad);
                
                InstitucionDAO objInstitucionDAO = new InstitucionDAO();
                 ArrayList listainstitucionB  = objInstitucionDAO.Buscar(codcad);
                
             
              request.setAttribute("listainstitucion",listainstitucionB);
              getServletContext().getRequestDispatcher("/FrmInstitucionMant.jsp").forward(request, response);
                break;
            }
//            case 4:{
//                String mensaje="";
//                String codcad=request.getParameter("txtcodigo");
//                int codigo=Integer.parseInt(codcad);
//                String nombre = request.getParameter("txtnombre");
//                String estado = request.getParameter("txtestado");
//                InstitucionBean objCarreraBean = new InstitucionBean();
//                objCarreraBean.setCODINSTI(codigo);
//                objCarreraBean.setNOMBINSTI(nombre);
//                objCarreraBean.setSIGLA(estado);
//                InstitucionDAO objRegionDAO = new InstitucionDAO();
//               int estadoBoolean = objRegionDAO.InsertarCarrera(objCarreraBean);
//                if(estadoBoolean==1){
//                    mensaje="Registro Insertado !!";
//                }else{
//                    mensaje="Registro no insertado";
//                }
//                request.setAttribute("mensaje",mensaje);
//              // getServletContext().getRequestDispatcher("/FrmCarreraRegistrarMant.jsp").forward(request, response);
//                 InstitucionDAO objInstitucionDAO = new InstitucionDAO();
//                
//                
//                ArrayList listacarrera=objInstitucionDAO.ListarInstitucion();
//                request.setAttribute("listacarrera",listacarrera);
//                getServletContext().getRequestDispatcher("/FrmCarreraMant.jsp").forward(request, response);
//              
//                break;
//            }
            case 5:{
                InstitucionDAO objInstitucionDAO = new InstitucionDAO();
                ArrayList listainstitucion=objInstitucionDAO.ListarInstitucion();
                request.setAttribute("listainstitucion",listainstitucion);
                getServletContext().getRequestDispatcher("/FrmInstitucionMant.jsp").forward(request, response);
                break;
            }
//            case 6:{
//                String codcad=request.getParameter("COD");
//                int codigo = Integer.parseInt(codcad);
//                String nombre=request.getParameter("NOM");
//                String estado=request.getParameter("ESTADO");
//                InstitucionBean objCarreraBean = new InstitucionBean();
//                objCarreraBean.setCODCARRERA(codigo);
//                objCarreraBean.setNOMBCARRERA(nombre);
//                objCarreraBean.setESTADOCARRERA(estado);
//                request.setAttribute("datos", objCarreraBean);
//                getServletContext().getRequestDispatcher("/FrmCarreraModificarMant.jsp").forward(request, response);
//                break;
//            }
//            case 7:{
//                String mensaje="";
//                String codcad=request.getParameter("CODIGO");
//                int codigo=Integer.parseInt(codcad);
//                String nombre = request.getParameter("txtnombre");
//                String estado = request.getParameter("txtestado");
//                InstitucionBean objCarreraBean = new InstitucionBean();
//                objCarreraBean.setCODCARRERA(codigo);
//                objCarreraBean.setNOMBCARRERA(nombre);
//                objCarreraBean.setESTADOCARRERA(estado);
//                InstitucionDAO objInstitucionDAO = new InstitucionDAO();
//                int estadoV = objInstitucionDAO.ModificarCarrera(objCarreraBean);
//                if(estadoV==1){
//                    mensaje="Registro Modificado";
//                }else{
//                    mensaje="Registro no Modificado";
//                }
//                request.setAttribute("mensaje",mensaje);
//                request.setAttribute("datos",objCarreraBean);
//                getServletContext().getRequestDispatcher("/FrmCarreraModificarMant.jsp").forward(request, response);
//                break;
//            }
//            case 8:{
//                String codcad=request.getParameter("COD");
//                int codigo = Integer.parseInt(codcad);
//
//                InstitucionBean objCarreraBean = new InstitucionBean();
//                objCarreraBean.setCODCARRERA(codigo);
//                
//                InstitucionDAO objInstitucionDAO = new InstitucionDAO();
//                objInstitucionDAO.EliminarCarrera(objCarreraBean);
//                
//                ArrayList listainstitucion=objInstitucionDAO.ListarInstitucion();
//                request.setAttribute("listainstitucion",listainstitucion);
//                getServletContext().getRequestDispatcher("/FrmCarreraMant.jsp").forward(request, response);
//                break;
//            }
            
            
            
        }
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
