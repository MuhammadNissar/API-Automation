package com.api.automation.deleteRequest;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TestPostRunner {
	
	
	@Test
	public Karate runTest()
	{
		return Karate.run("deleteRequest").relativeTo(getClass());
		
	}

}
