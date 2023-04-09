package com.api.automation.scenarioOutLine;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class Runner {
	
	@Test
	public Karate testRun()
	{
		return Karate.run("scenarioOutLine").relativeTo(getClass());
	}


}
