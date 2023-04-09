package com.api.automation;


import org.junit.jupiter.api.Test;

import com.intuit.karate.Runner;
import com.intuit.karate.Runner.Builder;

public class ParallelRunnerwithTags {
	@Test
	public void runner() {
//		Builder aRunner = new Builder();
//		aRunner.path("classpath:com/api/automation");
//		aRunner.parallel(5);
//		aRunner.tags("@smoke");
		Runner.path("classpath:com/api/automation").tags("@regrassion").parallel(5);
		
		
	}

}
