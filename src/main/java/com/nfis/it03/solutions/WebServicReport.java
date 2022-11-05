package com.nfis.it03.solutions;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Scanner;



public class WebServicReport {
	
	public String getFinancialData( String finSymbol ) throws Exception{
					
		String fs = URLEncoder.encode(finSymbol, "UTF-8");
		String returnMsg = "No Data Found";
		    
	    String queryURL = String.format("https://query1.finance.yahoo.com/v10/finance/quoteSummary/%s?modules=financialData", fs);
	    URL url = new URL(queryURL);
	    
		Scanner scan = new Scanner(url.openStream());
	    String data = new String();
	    
	    while (scan.hasNext()) {
	    	data += scan.nextLine();
	    }
	    scan.close();
	    
	    if( !data.isEmpty() ) {
	    	returnMsg = data;
	    }
	    
	    return returnMsg;

	}

}