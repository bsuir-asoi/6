package Java_Lab4_Server;

import javax.jws.WebService;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Arrays;

@WebService(endpointInterface = "Java_Lab4_Server.FileDownloaderWebService")
public class FileDownloaderWebServiceImpl implements FileDownloaderWebService{

    @Override
    public ArrayList<String> GetCatalog()
    {
        File f = new File("D:/");
        ArrayList<String> list = new ArrayList<>(Arrays.asList(f.list()));
        return list;
    }

    @Override
    public String GetFile(String name)
    {
        String file_content;
        if (name.contains(".txt"))
        {
            try{
                file_content = new String(Files.readAllBytes(Paths.get("D:/" + name)));
            }catch (IOException Error)
            {
                return "Can't read file";
            }
        }
        else
        {
            return "Can't read file";
        }
        return file_content;
    }
}
