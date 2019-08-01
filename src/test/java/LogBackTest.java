import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * @Author: libaogang
 * @Date: 2019-07-28 20:20
 * @Description 日志测试
 */
public class LogBackTest {
    private static Logger log = LoggerFactory.getLogger(LogBackTest.class);

    @Test
    public void test() {
        log.trace("======trace");
        log.debug("======debug");
        log.info("======info");
        log.warn("======warn");
        log.error("======error");
    }
}