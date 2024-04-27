package com.jfeat.fs;

import com.jfeat.fs.util.CacheMap;
import org.junit.Test;
import org.springframework.util.Assert;

import java.io.File;
import java.util.concurrent.TimeUnit;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;

/**
 * Created by jackyhuang on 2018/1/20.
 */
public class CacheMapTest {

    @Test
    public void test() throws InterruptedException {
        CacheMap cacheMap = CacheMap.getDefault();
        cacheMap.put("abc", "ABC");
        assertEquals("ABC", cacheMap.get("abc"));

        TimeUnit.SECONDS.sleep(61);
        assertNull(cacheMap.get("abc"));
    }

    @Test
    public void testStringJoinNull() throws InterruptedException {
        String root = "/path/to".replace("/", File.separator);
        String bucket = null;
        String filename = "image.png";

        String result = String.join(File.separator, root, bucket, filename);
        Assert.isTrue(result.equals("/path/to/null/image.png".replace("/", File.separator)));

        bucket = "";
        result = String.join(File.separator, root, bucket, filename);
        Assert.isTrue(result.equals("/path/to//image.png".replace("/", File.separator)));
    }

}
