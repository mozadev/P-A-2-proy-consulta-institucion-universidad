import BEAN.InstitucionBean;
import DAO.InstitucionDAO;
import java.util.ArrayList;
public class main {
    
    public static void main(String[] args) {
        ArrayList<InstitucionBean> lista=new ArrayList<>();
        InstitucionDAO objAO=new InstitucionDAO();
       lista= objAO.Buscar("marcos");
       
        for (int i = 0; i < lista.size(); i++)
        {
              System.out.println("\n"+lista.get(i).getNOMBINSTI());
        }
          
     
        
        
    }
    
}
