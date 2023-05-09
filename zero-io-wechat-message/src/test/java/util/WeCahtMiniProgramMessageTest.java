package util;

import com.jfeat.AmApplication;
import com.jfeat.wechatmessage.common.WeChatMiniProgramMessage;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;

/**
 * @description: TODO
 * @project: zero-io-wechat-message
 * @version: 1.0
 * @date: 2023/4/24 11:18
 * @author: hhhhhtao
 */
@RunWith(SpringRunner.class)
@SpringBootTest(classes = AmApplication.class,webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
public class WeCahtMiniProgramMessageTest {

    private static final Logger logger = LoggerFactory.getLogger(WeCahtMiniProgramMessageTest.class);

    @Resource
    WeChatMiniProgramMessage weChatMiniProgramMessage;

    @Test
    public void should_returnToken_when_getToken_given_getToken() {

        // 匠城小程序 appid
         String houseAppAppid = "";
        // 匠城小程序 appSecret
         String houseAppSecret = "";

        logger.info("获取到的token : " + weChatMiniProgramMessage.getAccessToken(houseAppAppid,houseAppSecret));
    }

}
