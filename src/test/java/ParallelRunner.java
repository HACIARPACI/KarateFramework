import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import net.masterthought.cucumber.*;
import org.junit.Test;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.junit.Test;


import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import  net.masterthought.cucumber.*;

import static org.junit.Assert.assertTrue;


public class ParallelRunner {
    @Test
    public void testParallel(){
        Results results= Runner.path("classpath:features").tags("~@ignore").parallel(5);
        generateReport(results.getReportDir());
        assertTrue(results.getErrorMessages(),results.getFailCount()==0);

    }

    private void generateReport(String karateOutputPath) {
        Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutputPath), new String[] {"json"}, true);
        List<String> jsonPaths = new ArrayList(jsonFiles.size());
        jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));

        Configuration config=new Configuration(new File("target"), "demo");

        ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
        reportBuilder.generateReports();
    }
}