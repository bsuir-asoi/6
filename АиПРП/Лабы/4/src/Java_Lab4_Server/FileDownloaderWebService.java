package Java_Lab4_Server;

import javax.jws.WebMethod;
import javax.jws.WebService;
import java.util.ArrayList;

@WebService(serviceName = "FileDownloader")
public interface FileDownloaderWebService {
    @WebMethod
    ArrayList<String> GetCatalog();
    @WebMethod
    String GetFile(String name);
}