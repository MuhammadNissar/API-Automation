package com.api.automation.config;

import org.junit.jupiter.api.BeforeAll;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;



public class TestVariableRunner {
	
	@Test
	public Karate testRun()
	{
		return Karate.run("configDemo").relativeTo(getClass());
	}
	

	@BeforeAll
	public static void config()
	{
		System.setProperty("karate.env", "qa");
	}
}
