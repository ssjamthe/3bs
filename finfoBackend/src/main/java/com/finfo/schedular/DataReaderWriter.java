package com.finfo.schedular;

import java.io.BufferedInputStream;
import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;


public class DataReaderWriter {
	public void readData() {
		 HttpClient httpClient = new DefaultHttpClient();
		 HttpGet httpGetRequest = new HttpGet("http://data.consumerfinance.gov/api/views/s6ew-h6mp/rows.csv");
		 HttpResponse httpResponse = null ;
		 System.out.println("Inside Data Reader...");
		
	      // Execute HTTP request
	     
		try {
			  FileWriter writer = new FileWriter("/Users/swapnil.jamthe/Desktop/InputFile/input.txt");
			  BufferedWriter bWriter = new BufferedWriter(writer);
			  httpResponse = httpClient.execute(httpGetRequest);
			  HttpEntity entity = httpResponse.getEntity();
			  byte[] buffer = new byte[1024];
		      if (entity != null) {
		        InputStream inputStream = entity.getContent();
		        try {
		          int bytesRead = 0;
		          BufferedInputStream bis = new BufferedInputStream(inputStream);
		          while ((bytesRead = bis.read(buffer)) != -1) {
		            String chunk = new String(buffer, 0, bytesRead);
		            bWriter.write(chunk);
		          }
		        } catch (IOException ioException) {
		          // In case of an IOException the connection will be released
		          // back to the connection manager automatically
		          ioException.printStackTrace();
		        } catch (RuntimeException runtimeException) {
		          // In case of an unexpected exception you may want to abort
		          // the HTTP request in order to shut down the underlying
		          // connection immediately.
		          httpGetRequest.abort();
		          runtimeException.printStackTrace();
		        } finally {
		          // Closing the input stream will trigger connection release
		          try {
		            inputStream.close();
		          } catch (Exception ignore) {
		          }
		        }
		      }
		} catch (ClientProtocolException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
		      // When HttpClient instance is no longer needed,
		      // shut down the connection manager to ensure
		      // immediate deallocation of all system resources
		      httpClient.getConnectionManager().shutdown();
		    }
	}

}
