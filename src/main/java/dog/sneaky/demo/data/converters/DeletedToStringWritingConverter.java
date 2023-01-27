package dog.sneaky.demo.data.converters;


import dog.sneaky.demo.data.dp.Deleted;
import org.apache.commons.lang3.BooleanUtils;
import org.springframework.core.convert.converter.Converter;
import org.springframework.data.convert.WritingConverter;

@WritingConverter
public class DeletedToStringWritingConverter implements Converter<Deleted, String> {
    @Override
    public String convert(Deleted source) {
        return BooleanUtils.toString(source.value(), "Y", "N");
    }

}
