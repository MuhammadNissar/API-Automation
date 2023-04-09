package com.api.automation.getJWTToken;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TestJWTRunner {
	
	
	@Test
	public Karate runTest()
	{
		return Karate.run("getJWTToken").relativeTo(getClass());
		
	}

}
