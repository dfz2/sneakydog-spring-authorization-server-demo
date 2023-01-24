package dog.sneaky.demo.data.converters;


import org.apache.commons.lang3.BooleanUtils;
import org.springframework.core.convert.converter.Converter;
import org.springframework.data.convert.WritingConverter;

@WritingConverter
public class BooleanToIntWritingConverter implements Converter<Boolean, Integer> {
    @Override
    public Integer convert(Boolean source) {
        return BooleanUtils.toInteger(source);
    }
}
