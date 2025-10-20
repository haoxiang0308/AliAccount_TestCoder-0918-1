import org.junit.platform.launcher.Launcher;
import org.junit.platform.launcher.LauncherDiscoveryRequest;
import org.junit.platform.launcher.core.LauncherDiscoveryRequestBuilder;
import org.junit.platform.launcher.core.LauncherFactory;
import org.junit.platform.launcher.listeners.SummaryGeneratingTestExecutionListener;
import org.junit.platform.launcher.listeners.TestExecutionSummary;

import static org.junit.platform.engine.discovery.DiscoverySelectors.selectClass;

public class TestRunner {
    public static void main(String[] args) {
        LauncherDiscoveryRequest request = LauncherDiscoveryRequestBuilder.request()
                .selectors(selectClass(CalculatorAdditionTest.class))
                .build();

        Launcher launcher = LauncherFactory.create();
        SummaryGeneratingTestExecutionListener listener = new SummaryGeneratingTestExecutionListener();
        launcher.registerTestExecutionListeners(listener);
        launcher.execute(request);

        TestExecutionSummary summary = listener.getSummary();
        System.out.println("Tests executed: " + summary.getTestsFoundCount());
        System.out.println("Tests successful: " + summary.getTestsSucceededCount());
        System.out.println("Tests failed: " + summary.getTestsFailedCount());
        
        if (summary.getTestsFailedCount() > 0) {
            System.exit(1);
        }
    }
}