package com.api.automation.Auth.basicGet;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TestVariableRunner {
	
	@Test
	public Karate testRun()
	{
		return Karate.run("basicAuth").relativeTo(getClass());
	}

}
