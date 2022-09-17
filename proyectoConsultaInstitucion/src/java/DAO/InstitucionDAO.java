
package DAO;

import BEAN.InstitucionBean;
import UTIL.ConexionBD;
import java.util.*;
import java.sql.*;

public class InstitucionDAO {
    //conexion base datos
    Connection cn=null;
    PreparedStatement pt=null;
    ResultSet rs=null;
    ArrayList<InstitucionBean> lista=null;
    
    InstitucionBean objInstitucionBean=null;
 
     
    public ArrayList<InstitucionBean> ListarInstitucion(){
        try {
            cn=ConexionBD.getConexionBD();
            pt=cn.prepareStatement("select * from institucion;");
            rs=pt.executeQuery();
            lista=new ArrayList<InstitucionBean>();
            while(rs.next()){
                objInstitucionBean=new InstitucionBean();
                objInstitucionBean.setCODINSTI(rs.getInt(1));
                objInstitucionBean.setNOMBINSTI(rs.getString(2));
                objInstitucionBean.setSIGLA(rs.getString(3));
                objInstitucionBean.setREPRESENTANTE(rs.getString(4));
                objInstitucionBean.setDOMICILIO(rs.getString(5));
                objInstitucionBean.setEMAIL(rs.getString(6));
                objInstitucionBean.setRUC(rs.getString(7));
                objInstitucionBean.setSITUACION(rs.getString(8));
                objInstitucionBean.setCODTIPO(rs.getInt(9));
                objInstitucionBean.setCODDEPA(rs.getInt(10));
                objInstitucionBean.setCODPROVI(rs.getInt(11));
                objInstitucionBean.setCODDISTRI(rs.getInt(12));
               
                lista.add(objInstitucionBean);
            }
            pt.close();
            rs.close();
            cn.close();
        } catch (Exception e) {
        }
        return lista;
    }
    

  
    
      public ArrayList<InstitucionBean> Buscar(String texto){
          
          ArrayList<InstitucionBean> lista=new ArrayList<>();
           String sql;
           sql="select * from institucion where NOMBINSTI like '%"+texto+"%' ";
           try
           {
              cn=ConexionBD.getConexionBD();
            pt=cn.prepareStatement(sql);
            rs=pt.executeQuery();
            
              while(rs.next()){
                  
                  
                objInstitucionBean=new InstitucionBean();
                objInstitucionBean.setCODINSTI(rs.getInt("CODINSTI"));
                objInstitucionBean.setNOMBINSTI(rs.getString("NOMBINSTI"));
                objInstitucionBean.setSIGLA(rs.getString("SIGLA"));
                objInstitucionBean.setREPRESENTANTE(rs.getString("REPRESENTANTE"));
                objInstitucionBean.setRUC(rs.getString("RUC"));
              objInstitucionBean.setCODTIPO(rs.getInt("CODTIPO"));
                objInstitucionBean.setCODDISTRI(rs.getInt("CODDISTRI"));
                objInstitucionBean.setCODPROVI(rs.getInt("CODPROVI"));
            
               
                lista.add(objInstitucionBean);
            }
              
           } catch (Exception e)
           {
           }
      
           return lista;
    }
    
//    public int InsertarCarrera(InstitucionBean objRegionBean){
//        int estado=0;
//        try {
//            cn=ConexionBD.getConexionBD();
//            pt=cn.prepareStatement("insert into carrera(CODCARRERA,NOMBCARRERA,ESTADOCARRERA) VALUES(?,?,?);");
//            pt.setInt(1, objRegionBean.getCODCARRERA());
//            pt.setString(2, objRegionBean.getNOMBCARRERA());
//            pt.setString(3, objRegionBean.getESTADOCARRERA());
//            estado=pt.executeUpdate();
//            pt.close();
//            cn.close();
//        } catch (Exception e) {
//        }
//        return estado;
//    }
//    
//    public int ModificarCarrera(InstitucionBean objCarreraBean){
//        int estado=0;
//        try {
//            cn=ConexionBD.getConexionBD();
//            pt=cn.prepareStatement("UPDATE carrera set NOMBCARRERA=? , ESTADOCARRERA=? WHERE CODCARRERA=?;");
//            pt.setString(1, objCarreraBean.getNOMBCARRERA());
//            pt.setString(2, objCarreraBean.getESTADOCARRERA());
//            pt.setInt(3, objCarreraBean.getCODCARRERA());
//            estado=pt.executeUpdate();
//            pt.close();
//            cn.close();
//        } catch (Exception e) {
//        }
//        return estado;
//    }
    
//    public int EliminarCarrera(InstitucionBean objCarreraBean){
//        int estado=0;
//        try {
//            cn=ConexionBD.getConexionBD();
//            pt=cn.prepareStatement("DELETE FROM carrera WHERE CODCARRERA=?;");
//            pt.setInt(1, objCarreraBean.getCODCARRERA());
//            estado=pt.executeUpdate();
//            pt.close();
//            cn.close();
//        } catch (Exception e) {
//        }
//        return estado;
//    }

    
}
