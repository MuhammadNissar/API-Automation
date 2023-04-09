package com.api.automation.patchRequest;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TestGetRunner {
	
	
	@Test
	public Karate patchRunTest()
	{
		return Karate.run("patchRequest").relativeTo(getClass());
		
	}

}
