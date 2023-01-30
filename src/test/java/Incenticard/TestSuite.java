package Incenticard;

import java.io.File;
import java.io.IOException;

import org.apache.commons.io.FileUtils;
import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.runner.RunWith;

import io.cucumber.junit.CucumberOptions;
import net.serenitybdd.core.Serenity;
import net.serenitybdd.cucumber.CucumberWithSerenity;
import net.thucydides.core.reports.html.HtmlAggregateStoryReporter;

@RunWith(CucumberWithSerenity.class)
@CucumberOptions(
        strict = true,
        plugin = {"pretty"},
        features = "src/test/resources/features"
)
public class TestSuite {
        static final File reportSrcPath = new File("target/site/serenity");
        @BeforeClass
        public static void beforeClass() throws IOException {
            try {
                FileUtils.deleteDirectory(reportSrcPath);
            } catch (IOException e) {
                e.printStackTrace();
            }
            reportSrcPath.mkdirs();
    }
    @AfterClass
    public static void afterClass() {
        HtmlAggregateStoryReporter reporter = new HtmlAggregateStoryReporter(Serenity.getDefaultProjectKey());
        reporter.setOutputDirectory(reportSrcPath);
        try {
            reporter.generateReportsForTestResultsFrom(reportSrcPath);
            Runtime.getRuntime().exec("cmd.exe /c mvn serenity:aggregate");
        }
        catch (IOException e)
        {
            System.out.println("generateReportsForTestResultsFrom exception ");
            e.printStackTrace();
        }
    }
}


