package com.api.automation.postRequest;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TestPostRunner {
	
	
	@Test
	public Karate runTest()
	{
		return Karate.run("./src/test/java/com/api/automation/postRequest/fileUpload/fileUpload.feature");
		
	}

}
