package dog.sneaky.demo.common;


import dog.sneaky.demo.common.util.JsonUtil;
import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class TestResponse extends Response<TestResponse> {
    private String test;


    public static void main(String[] args) {
        TestResponse testResponse = new TestResponse();
        testResponse.setTest("12313");
        testResponse.setErrCode("11");
        testResponse.setErrMessage("1231313");
        System.out.println(JsonUtil.toJsonString(testResponse));
    }
}
