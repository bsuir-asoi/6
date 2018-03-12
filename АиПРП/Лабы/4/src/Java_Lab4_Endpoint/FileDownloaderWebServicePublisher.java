package Java_Lab4_Endpoint;

import javax.xml.ws.Endpoint;
import Java_Lab4_Server.FileDownloaderWebServiceImpl;

public class FileDownloaderWebServicePublisher {
    public static void main(String... args)
    {
        System.out.print("Server had started");
        Endpoint.publish("http://localhost:9000/services/webservice", new FileDownloaderWebServiceImpl());
    }
}

