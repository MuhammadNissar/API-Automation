package com.api.automation;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import com.intuit.karate.Results;
import com.intuit.karate.Runner.Builder;

import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;

public class ParallelRunnerWithCucumberReport
{
	@Test
	public void runner()
	{
		Builder aRunner = new Builder();
		aRunner.path("classpath:com/api/automation").outputCucumberJson(true);
		Results result  = aRunner.parallel(5);
		System.out.println("Totla features = "+ result.getFeaturesTotal());
		System.out.println("Totla Scenarios = "+ result.getScenariosTotal());
		System.out.println("Totla Passed Scenarios= "+ result.getScenariosPassed());
		getCucumberReport(result.getReportDir());
		//Assertions.assertEquals(0, result.getFailCount(),"There are some filed Scenarios");
	}
	
	//reportDirLocation this will take to the result folder
		private void getCucumberReport(String reportDirLocation)
		{
			//Creating file object to filter json files
			File reportDir = new File(reportDirLocation);
			//Filtering json files by using fileUtils
			Collection<File> jsonFileCollection=FileUtils.listFiles(reportDir, new String[] {"json"}, true);
			
			List<String> jsonFiles = new ArrayList<String>();
			jsonFileCollection.forEach(file -> jsonFiles.add(file.getAbsolutePath()));
			Configuration config = new Configuration(reportDir, "API testing");
			ReportBuilder reportBuilder = new ReportBuilder(jsonFiles, config);
			reportBuilder.generateReports();
			
			
		}

}
